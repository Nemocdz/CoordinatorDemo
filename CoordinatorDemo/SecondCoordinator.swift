//
//  SecondCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

protocol SecondCoordinator: Coordinator {
    func finish()
}

class SecondCoordinatorPresentImpl: SecondCoordinator {
    unowned let fromViewController: UIViewController
    unowned var viewController: SecondViewController!
    
    weak var delegate: SecondViewControllerDelegate?
    
    let input: SecondViewController.Input
    
    init(from viewController: UIViewController, input: SecondViewController.Input) {
        self.fromViewController = viewController
        self.input = input
    }
    
    func start() {
        let viewController = SecondViewController(input: input)
        viewController.delegate = delegate
        viewController.coordinator = self
        let navigationConroller = UINavigationController(rootViewController: viewController)
        fromViewController.present(navigationConroller, animated: true, completion: nil)
        self.viewController = viewController
    }
    
    func finish() {
        fromViewController.dismiss(animated: true, completion: nil)
    }
}

class SecondCoordinatorPushImpl: SecondCoordinator {
    unowned let navigationController: UINavigationController
    unowned var viewController: SecondViewController!
    
    weak var delegate: SecondViewControllerDelegate?
    
    let input: SecondViewController.Input
    
    init(from navigationController: UINavigationController, input: SecondViewController.Input) {
        self.navigationController = navigationController
        self.input = input
    }
    
    func start() {
        let viewController = SecondViewController(input: input)
        viewController.delegate = delegate
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}
