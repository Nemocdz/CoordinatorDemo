//
//  FirstViewController.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/25.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    struct Output {
        let color: UIColor
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
        view.backgroundColor = .systemGray
        button.setTitle("push second", for: .normal)
        button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func clickButton(_ sender: UIButton) {
        let output = Output(color: view.backgroundColor!)
        let viewController = SecondViewController(input: .init(output: output))
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension FirstViewController: SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output) {
        navigationController?.popViewController(animated: true)
        view.backgroundColor = output.color
    }
}

extension SecondViewController.Input {
    init(output: FirstViewController.Output) {
        color = output.color
    }
}
