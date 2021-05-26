//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/26.
//

import Foundation
import UIKit

protocol Coordinator: UIViewController {
    func start()
}

extension UIViewController {
    func add(child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
