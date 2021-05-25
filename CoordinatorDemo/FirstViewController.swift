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
    
    var coordinator: FirstCoordinator!
    
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
        coordinator.presentSecond(output: output)
    }
}

extension FirstViewController {
    func updateColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

extension SecondViewController.Input {
    init(output: FirstViewController.Output) {
        color = output.color
    }
}
