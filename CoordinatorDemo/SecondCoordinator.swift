//
//  SecondCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

class SecondCoordinator: Coordinator {
    enum ShowType {
        case present(UIViewController)
        case push(UINavigationController)
    }
    
    let showType: ShowType
    unowned var viewController: SecondViewController!
    
    weak var delegate: SecondViewControllerDelegate?
    
    let input: SecondViewController.Input
    
    init(showType: ShowType, input: SecondViewController.Input) {
        self.showType = showType
        self.input = input
    }
    
    func start() {
        let viewController = SecondViewController(input: input)
        viewController.delegate = delegate
        viewController.coordinator = self
        switch showType {
            case .present(let fromViewController):
                let navigationConroller = UINavigationController(rootViewController: viewController)
                fromViewController.present(navigationConroller, animated: true, completion: nil)
            case .push(let navigationController):
                navigationController.pushViewController(viewController, animated: true)
        }
        self.viewController = viewController
    }
    
    func finish() {
        switch showType {
            case .present(let fromViewController):
                fromViewController.dismiss(animated: true, completion: nil)
            case .push(let navigationController):
                navigationController.popViewController(animated: true)
        }
    }
}
