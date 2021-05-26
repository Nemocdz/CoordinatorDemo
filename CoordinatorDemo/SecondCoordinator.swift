//
//  SecondCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

protocol SecondCoordinator: AnyObject {
    func finish()
}

class SecondCoordinatorPresentImpl: UIViewController, SecondCoordinator, Coordinator {
    unowned let fromViewController: UIViewController
    unowned var viewController: SecondViewController!
    
    weak var delegate: SecondViewControllerDelegate?
    
    let input: SecondViewController.Input
    
    init(from viewController: UIViewController, input: SecondViewController.Input) {
        self.fromViewController = viewController
        self.input = input
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        let viewController = SecondViewController(input: input)
        viewController.delegate = delegate
        viewController.coordinator = self
        let navigationController = UINavigationController(rootViewController: viewController)
        add(child: navigationController)
        fromViewController.present(self, animated: true, completion: nil)
        self.viewController = viewController
    }
    
    func finish() {
        fromViewController.dismiss(animated: true, completion: nil)
    }
}

class SecondCoordinatorPushImpl: UIViewController, SecondCoordinator, Coordinator {
    unowned let _navigationController: UINavigationController
    unowned var viewController: SecondViewController!
    
    weak var delegate: SecondViewControllerDelegate?
    
    let input: SecondViewController.Input
    
    init(from navigationController: UINavigationController, input: SecondViewController.Input) {
        self._navigationController = navigationController
        self.input = input
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        let viewController = SecondViewController(input: input)
        viewController.delegate = delegate
        viewController.coordinator = self
        add(child: viewController)
        _navigationController.pushViewController(self, animated: true)
        self.viewController = viewController
    }
    
    func finish() {
        _navigationController.popViewController(animated: true)
    }
}
