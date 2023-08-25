//
//  CodeNextViewController.swift
//  Navigation
//
//  Created by HAQQQABD on 23/08/2023.
//

import UIKit

class CodeNextViewController: UIViewController {
    
    let label = UILabel()
    
    init(labelString: String){
        label.text = labelString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        activateEquelConstraint(.centerX, fromItem: label, toItem: view)
        activateEquelConstraint(.centerY, fromItem: label, toItem: view)
    }
    
    private func activateEquelConstraint(_ attribute: NSLayoutConstraint.Attribute,
                                 fromItem: UIView,
                                 toItem: UIView){
        NSLayoutConstraint(item: fromItem, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: attribute, multiplier: 1, constant: 0).isActive = true
    }
    
    deinit {
        print(">> ViewController.deinit")
    }
 

}
