//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import UIKit

class AppCoordinator: UIViewController, Coordinator {    
    func start() {
        let mainCoordinator = MainCoordinatorImpl()
        mainCoordinator.start()
        add(child: mainCoordinator)
    }
}
