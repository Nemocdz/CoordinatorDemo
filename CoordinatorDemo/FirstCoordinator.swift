//
//  FirstCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

protocol FirstCoordinator: AnyObject {
    func presentSecond(output: FirstViewController.Output)
}

class FirstCoordinatorImpl: UIViewController, FirstCoordinator, Coordinator {
    unowned let fromViewController: UIViewController
    unowned var viewController: FirstViewController!
    unowned var _navigationController: UINavigationController!
    
    init(from viewController: UIViewController) {
        fromViewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func start() {
        let viewController = FirstViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        self._navigationController = navigationController
        add(child: navigationController)
        viewController.coordinator = self
        fromViewController.present(self, animated: true, completion: nil)
        self.viewController = viewController
    }
    
    func presentSecond(output: FirstViewController.Output) {
        let coordinator = SecondCoordinatorPushImpl(from: _navigationController, input: .init(output: output))
        coordinator.delegate = self
        coordinator.start()
    }
}

extension FirstCoordinatorImpl: SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output) {
        self.viewController.updateColor(output.color)
    }
}
