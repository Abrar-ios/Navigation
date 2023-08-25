//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by HAQQQABD on 23/08/2023.
//

import UIKit

class SegueNextViewController: UIViewController {
    
    var labelText: String?
    @IBOutlet private(set) var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print(">> SegueNextViewController.deinit")
    }

}
