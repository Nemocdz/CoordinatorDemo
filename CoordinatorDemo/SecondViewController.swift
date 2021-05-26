//
//  SecondViewController.swift
//  CoordinatorDemo
//
//  Created by Nemo on 2021/5/25.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func secondViewController(_ viewController: SecondViewController, didCloseWith output: SecondViewController.Output)
}

class SecondViewController: UIViewController {
    struct Input {
        let color: UIColor
    }
    
    struct Output {
        let color: UIColor
    }
    
    weak var delegate: SecondViewControllerDelegate?
    weak var coordinator: SecondCoordinator?
    
    let button = UIButton(type: .custom)
    
    let input: Input
    
    init(input: Input) {
        self.input = input
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        view.backgroundColor = input.color
        button.setTitle("close", for: .normal)
        button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func clickButton(_ sender: UIButton) {
        delegate?.secondViewController(self, didCloseWith: .init(color: view.backgroundColor!))
        coordinator?.finish()
    }
}
