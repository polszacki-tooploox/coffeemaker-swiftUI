//
//  CoreDataEntitiesPublisherProviderTests.swift
//  DataTests
//
//  Created by Przemysław Olszacki on 27/11/2020.
//

import XCTest
import CoreData
import Combine
@testable import Data

class CoreDataEntitiesPublisherProviderTests: XCTestCase {

    var context: NSManagedObjectContext!
    var cancellables: Set<AnyCancellable>!

    let coffeeNames = ["Espresso Mix", "Moonless Night", "Black Hole"]

    override func setUp() {
        context = TestCoreDataStack().defaultContext
        deleteAllData()
        prepareMockData(names: coffeeNames)
        cancellables = []
    }

    func testFetchingData() {
        let request: NSFetchRequest<Coffee> = Coffee.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Coffee.name, ascending: true)]
        let values = try? context.fetch(request)
        XCTAssertEqual(values?.map(\.name), coffeeNames.sorted())
    }

    func testEmitingOnSubscription() {
        let receivedAllValues = expectation(description: "all values received")

        let request: NSFetchRequest<Coffee> = Coffee.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Coffee.name, ascending: true)]
        let provider = CoreDataEntitiesPublisherProvider(fetchRequest: request, context: context)
        provider.publisher
            .assertNoFailure()
            .sink(receiveValue: {
                if $0.map(\.name) == self.coffeeNames.sorted() {
                    receivedAllValues.fulfill()
                }
            }).store(in: &cancellables)

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testEmitingOnChanges() {
        let receivedAllValues = expectation(description: "all values received")
        receivedAllValues.assertForOverFulfill = false
        let newNames = ["NewName", "NewName2"]

        let request: NSFetchRequest<Coffee> = Coffee.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Coffee.name, ascending: true)]
        let provider = CoreDataEntitiesPublisherProvider(fetchRequest: request, context: context)
        provider.publisher
            .assertNoFailure()
            .sink(receiveValue: {
                if $0.map(\.name) == (self.coffeeNames + newNames).sorted() {
                    receivedAllValues.fulfill()
                }
            }).store(in: &cancellables)
        prepareMockData(names: newNames)
        waitForExpectations(timeout: 5, handler: nil)
    }

    private func prepareMockData(names: [String]) {
        names.forEach {
            let coffeeEntity = NSEntityDescription.entity(forEntityName: Coffee.entity().name!, in: context)!
            let coffee = NSManagedObject(entity: coffeeEntity, insertInto: context) as! Coffee
            coffee.name = $0
        }
        do {
            try context.save()
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    private func deleteAllData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Coffee.entity().name!)
        fetchRequest.returnsObjectsAsFaults = false
        if let results = try? context.fetch(fetchRequest) {
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
        }
    }
}
