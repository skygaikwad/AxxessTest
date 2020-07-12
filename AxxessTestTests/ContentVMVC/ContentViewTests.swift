//
//  ContentViewTests.swift
//  AxxessTestTests
//
//  Created by apple on 7/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import XCTest
import Moya

@testable import AxxessTest


class ContentViewTests: XCTestCase {
    
    let api = FakeAPIManager()
    var vc : ContentViewController?
    var sut : ContentViewModel?

    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ContentViewModel(withAPIManage: api)
        vc = ContentViewController()
        _ = vc?.view

    }

    override func tearDownWithError() throws {
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
    
    // MARK:- Test Funcs
    func testViewLoadForVc() {
          XCTAssertNotNil(vc?.view)
      }
      func testParentHasTableView() {
          XCTAssertTrue(((vc?.view.subviews.contains(self.vc!.tableView)) != nil))
      }
      func testTableviewLoaded() {
          XCTAssertNotNil(vc?.tableView)
          
      }
      
      
      func testTableViewDelegateAndDataSource() {
          XCTAssertNotNil(self.vc?.conforms(to: UITableViewDelegate.self))
          XCTAssertNotNil(self.vc?.conforms(to: UITableViewDataSource.self))
          
          XCTAssertNotNil(self.vc?.tableView.delegate)
          
          
      }
      
      func testTableViewCellHasReuseIdentifierText() {
          _ = vc?.tableView(vc!.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ContetnTextCell
          let actualReuseIdentifer = ContetnTextCell.identifer
          let expectedReuseIdentifier = "ContetnTextCell"
          XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
      }
      
    func testTableViewCellHasReuseIdentifierImages() {
        _ = vc?.tableView(vc!.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ContentImageCell
        let actualReuseIdentifer = ContentImageCell.identifer
        let expectedReuseIdentifier = "ContentImageCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

      func testAPIResponse() {
        sut?.getAllContents()
          XCTAssertNotNil(sut?.items.value)
      }
      
    
    
    

}
extension ContentViewTests {
    
    struct FakeAPIManager : APINetworkable  {
        func excuteRequest(withAPI API: APIRequests, completionHandler: @escaping (Result<[ContentModel]?, APIErrors>) -> Void) {
            let apiProvider = MoyaProvider<APIRequests>.init(stubClosure: MoyaProvider.immediatelyStub)
            apiProvider.request(API) { (result) in
                switch result  {
                case .success(let response):
                    let apiModel = try? response.map([ContentModel].self)
                    completionHandler(.success(apiModel))
                case .failure( _):
                    let apiError = APIErrors.noResponse
                    completionHandler(.failure(apiError))
                }
            }
        }
    }
    
}
