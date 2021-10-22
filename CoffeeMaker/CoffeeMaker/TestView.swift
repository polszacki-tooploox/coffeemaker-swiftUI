//
//  TestView.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 21/10/2021.
//

import SwiftUI

final class TestStore: ObservableObject {

    enum State {
        case black
        case white
    }

    @Published private(set) var state: State = .black

    func updateState(state: State) {
        self.state = state
    }
}

struct TestView: View {

    @ObservedObject var testStore = TestStore()

    @ViewBuilder
    var body: some View {
        switch testStore.state {
        case .black:
            blackView
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    )
                )
        case .white:
            whiteView
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)
                    )
                )
        }
    }

    private var blackView: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Black screen")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    Button("Switch") {
                        withAnimation {
                            testStore.updateState(state: .white)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                }
            }
        }
    }

    private var whiteView: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("White screen")
                        .font(.largeTitle)
                    Button("Switch") {
                        withAnimation {
                            testStore.updateState(state: .black)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
