//
//  MainViewController.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let button1 = UIButton(type: .custom)
    let button2 = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        view.backgroundColor = .systemYellow
        
        button1.setTitle("present first", for: .normal)
        button1.addTarget(self, action: #selector(clickButton1(_:)), for: .touchUpInside)
        
        button2.setTitle("present second", for: .normal)
        button2.addTarget(self, action: #selector(clickButton2(_:)), for: .touchUpInside)
        
        view.addSubview(button1)
        view.addSubview(button2)
        
        button1.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        button2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(button1.snp.bottom).offset(20)
        }
    }
    
    @objc func clickButton1(_ sender: UIButton) {
        let navigationController = UINavigationController(rootViewController: FirstViewController())
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func clickButton2(_ sender: UIButton) {
        let viewController = SecondViewController(input: .init(color: view.backgroundColor!))
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
    }
}

extension MainViewController: SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output) {
        dismiss(animated: true, completion: nil)
        view.backgroundColor = output.color
    }
}
