//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

protocol MainCoordinator: AnyObject {
    func presentFirst()
    func presentSecond(color: UIColor)
}

class MainCoordinatorImpl: UIViewController, MainCoordinator, Coordinator {
    unowned var viewController: MainViewController!

    func start() {
        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        add(child: navigationController)
        viewController.coordinator = self
        self.viewController = viewController
    }
    
    func presentFirst() {
        let coordinator = FirstCoordinatorImpl(from: self)
        coordinator.start()
    }
    
    func presentSecond(color: UIColor) {
        let coordinator = SecondCoordinatorPresentImpl(from: self, input: .init(color: color))
        coordinator.delegate = self
        coordinator.start()
    }
}

extension MainCoordinatorImpl: SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output) {
        self.viewController.updateColor(output.color)
    }
}
