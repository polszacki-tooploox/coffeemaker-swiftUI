//
//  GetAllCoffees.swift
//  Domain
//
//  Created by Przemysław Olszacki on 13/11/2020.
//

import Foundation
import Combine

public final class GetAllCoffees {

    public init() {}

    public func execute() -> AnyPublisher<[Coffee], Never> {
        let testCoffees = [
            Coffee(name: "Się Przelewa Owoc", imagePath: nil),
            Coffee(name: "Geysha", imagePath: nil),
            Coffee(name: "Cloudberry", imagePath: nil),
            Coffee(name: "Tchibo Exclusive", imagePath: nil)

        ]
        return Just(testCoffees).eraseToAnyPublisher()
    }
}
