//
//  ViewController.swift
//  Navigation
//
//  Created by HAQQQABD on 23/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) var codePushButton: UIButton!
    @IBOutlet private(set) var codeModalButton: UIButton!
    @IBOutlet private(set) var seguePushButton: UIButton!
    @IBOutlet private(set) var segueModalButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func pushNextViewController(){
        let vc = CodeNextViewController(labelString: "Pushed from Code")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func  presentModalViewController(){
        let vc = CodeNextViewController(labelString: "present from code")
        self.present(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pushNext"?:
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            nextVC.labelText = "Pushed from segue"
        case "modalNext"?:
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            nextVC.labelText = "Present from segue"
        default:
            return
        }
    }
    
    deinit {
        print(">> ViewController.deinit")
    }

}

