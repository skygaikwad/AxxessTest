//
//  TopMenuTests.swift
//  AxxessTestTests
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import XCTest

@testable import AxxessTest

class TopMenuTests: XCTestCase {
    
    var sut : TopMenu?

    override func setUpWithError() throws {
        sut = TopMenu(with: ["Hello World"])
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testItemCount() {
        XCTAssertTrue((sut?.arrayItems!.count)!>0)
    }
    
    func testViewLoadForView() {
        XCTAssertNotNil(sut)
    }
    
    func testCollectionViewLoaded() {
        XCTAssertNotNil(sut?.collectionView)
    }
    
    
    func testCollectionViewDelegateAndDataSource() {
        XCTAssertNotNil(sut?.conforms(to: UICollectionViewDelegate.self))
        XCTAssertNotNil(sut?.conforms(to: UICollectionViewDataSource.self))
        
        XCTAssertNotNil(sut?.collectionView!.delegate)
        
        
    }
    
    func testCollectionViewCellHasReuseIdentifierLifeCycle() {
        _ = sut?.collectionView((sut?.collectionView)!, cellForItemAt: IndexPath(item: 0, section: 0)) as! TopMenuCell
        let actualReuseIdentifer = TopMenuCell.identifer
        let expectedReuseIdentifier = "TopMenuCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        
    }
    
    func testPageMenuDelegate() {
        let spyDelegate = SpyDelegate()
        sut?.delegate = spyDelegate
        
        let expected = expectation(description: "SomethingWithDelegate calls the delegate as the result of an async method completion")
        spyDelegate.expected = expected
        sut?.delegate?.didSelectMenuItem(with: "Hello", index: 0)
        //
        waitForExpectations(timeout: 0.5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
                        
            XCTAssertNil(error)
        }

    }
    
    func testFirstSelectionPageOption()  {
        let spyDelegate = SpyDelegate()
        sut?.delegate = spyDelegate
        
        let expected = expectation(description: "SomethingWithDelegate calls the delegate as the result of an async method completion")
        spyDelegate.expected = expected
        sut?.showSelectedIndex(with: 0)
        //
        waitForExpectations(timeout: 0.5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
                        
            XCTAssertNil(error)
        }
    }
    
    class SpyDelegate: TopMenuDelegate {
        var expected : XCTestExpectation?
        
        func didSelectMenuItem(with item: String, index: Int) {
            expected?.fulfill()
        }
    }
    
}
