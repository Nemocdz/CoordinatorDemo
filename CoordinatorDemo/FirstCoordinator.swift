//
//  FirstCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

class FirstCoordinator: Coordinator {
    unowned let fromViewController: UIViewController
    unowned var viewController: FirstViewController!
    unowned var navigationController: UINavigationController!
    
    init(from viewController: UIViewController) {
        fromViewController = viewController
    }
    
    func start() {
        let viewController = FirstViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.coordinator = self
        fromViewController.present(navigationController, animated: true, completion: nil)
        self.viewController = viewController
        self.navigationController = navigationController
    }
    
    func presentSecond(output: FirstViewController.Output) {
        let coordinator = SecondCoordinator(showType: .push(navigationController), input: .init(output: output))
        coordinator.delegate = self
        coordinator.start()
    }
}

extension FirstCoordinator: SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output) {
        self.viewController.updateColor(output.color)
    }
}