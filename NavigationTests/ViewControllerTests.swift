//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by HAQQQABD on 24/08/2023.
//

import XCTest
@testable import Navigation

final class ViewControllerTests:XCTestCase {
    func test_loading(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut : ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.codePushButton)
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut : ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        let navigation = UINavigationController(rootViewController: sut)
        tap(sut.codePushButton)
        executeRunLoop()
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
        XCTFail("Expected CodeNextViewController, "
        + "but was \(String(describing: pushedVC))")
        return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from Code")
    }
    
    func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextViewController(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        UIApplication.shared.windows.first?.rootViewController = sut
        tap(sut.codeModalButton)
        
        let presentedVC = sut.presentedViewController
        guard let codeNextVc = presentedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
            + "but was \(String(describing: presentedVC))")
            return
        }
        XCTAssertEqual(codeNextVc.label.text, "present from code")
    }
}
