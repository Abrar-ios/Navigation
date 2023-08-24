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
}
