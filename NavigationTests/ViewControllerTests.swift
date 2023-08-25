//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by HAQQQABD on 24/08/2023.
//

import XCTest
import ViewControllerPresentationSpy
@testable import Navigation
@MainActor
 final class ViewControllerTests:XCTestCase {
     private var presentationverifier: PresentationVerifier!
     private var sut: ViewController!
     
     override func setUp() {
         super.setUp()
         presentationverifier = PresentationVerifier()
         let sb = UIStoryboard(name: "Main", bundle: nil)
         let sut : ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
         sut.loadViewIfNeeded()
     }
     
     override func tearDown() {
         sut = nil
         presentationverifier = nil
         super.tearDown()
     }
     
    func test_loading(){
        XCTAssertNotNil(sut.codePushButton)
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController(){
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
    
     @MainActor func test_tappingCodeModalButton_shouldPresentCodeNextViewController(){
        tap(sut.codeModalButton)
        let codeNextVC: CodeNextViewController? = presentationverifier.verify( animated: true, presentingViewController: sut)
        XCTAssertEqual(codeNextVC?.label.text, "present from code")
        
    }
}
