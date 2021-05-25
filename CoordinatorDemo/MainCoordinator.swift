//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

class MainCoordinator: Coordinator {
    unowned let navigationController: UINavigationController
    unowned var viewController: MainViewController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
        self.viewController = viewController
    }
    
    func presentFirst() {
        let coordinator = FirstCoordinator(from: viewController)
        coordinator.start()
    }
    
    func presentSecond(color: UIColor) {
        let coordinator = SecondCoordinator(showType: .present(viewController), input: .init(color: color))
        coordinator.delegate = self
        coordinator.start()
    }
}

extension MainCoordinator: SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output) {
        self.viewController.updateColor(output.color)
    }
}
