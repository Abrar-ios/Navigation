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
     private var presentationVerifier: PresentationVerifier!
     private var sut: ViewController!
     
     override func setUp() {
         super.setUp()
         presentationVerifier = PresentationVerifier()
         let sb = UIStoryboard(name: "Main", bundle: nil)
         sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
         sut.loadViewIfNeeded()
         putWindow(sut)
     }
     
     override func tearDown() {
         sut = nil
         presentationVerifier = nil
         executeRunLoop()
         super.tearDown()
     }
     
    func test_loading(){
        XCTAssertNotNil(sut.codePushButton)
    }
    
     func test_tappingCodeModalButton_shouldPresentCodeNextViewController(){
        tap(sut.codeModalButton)
        
        let codeNextVC: CodeNextViewController? = presentationVerifier.verify( animated: true, presentingViewController: sut)
        XCTAssertEqual(codeNextVC?.label.text, "present from code")
        
    }
     
     func test_tappingSeguePushButton_shouldShowSegureNextViewController(){
         tap(sut.seguePushButton)
         
         let segueNextVC: SegueNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
         XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
     }
     
     func test_tappingSegueModalButton_shouldShowSegueNextViewController() {
         tap(sut.segueModalButton)
         let segueNextVC: SegueNextViewController? = presentationVerifier.verify( animated: true, presentingViewController: sut)
         XCTAssertEqual(segueNextVC?.labelText, "Modal from segue") }
}
