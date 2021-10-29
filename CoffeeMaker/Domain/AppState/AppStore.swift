//
//  AppStore.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 22/10/2021.
//

import Foundation
import Combine

public typealias Reducer<State, Action> = (State, Action) -> State
public typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

public typealias AppStore = Store<AppState, AppAction>

public final class Store<State, Action>: ObservableObject {

    @Published public private(set) var state: State
    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware<State, Action>]
    private let queue = DispatchQueue(label: "com.polszacki.CoffeeMaker.stateStore", qos: .userInitiated)
    private var subscriptions: Set<AnyCancellable> = []

    public init(
        initial: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>] = []) {
            self.state = initial
            self.reducer = reducer
            self.middlewares = middlewares
        }

    public func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)

        middlewares.forEach { middleware in
          let publisher = middleware(newState, action)
          publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: dispatch)
            .store(in: &subscriptions)
        }

        state = newState
    }
}
