//
//  NavBarStyle.swift
//  CoffeeMaker
//
//  Created by Przemysław Olszacki on 07/10/2021.
//

import SwiftUI

struct NavigationBarConfigurator: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationBarConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationBarConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
