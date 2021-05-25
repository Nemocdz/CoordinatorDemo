//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
        window.makeKeyAndVisible()
    }
}
