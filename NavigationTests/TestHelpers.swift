//
//  TestHelpers.swift
//  NavigationTests
//
//  Created by HAQQQABD on 24/08/2023.
//

import UIKit

func tap(_ button: UIButton){
    button.sendActions(for: .touchUpInside)
}

func executeRunLoop() { RunLoop.current.run(until: Date())
}

func putWindow(_ vc:UIViewController) {
    let window = UIWindow()
    window.rootViewController = vc
    window.isHidden = false
}

