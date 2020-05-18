//
//  DataTests.swift
//  DataTests
//
//  Created by Amir Ardalan on 4/19/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import XCTest
@testable import Data
@testable import AANetwork
import RxBlocking
import RxTest

class DataTests: XCTestCase {
    
    var network : BaseNetwork!
    var requester : NetworkRequest!
    var repositoryManager : RepositoryManager!
    
    override func setUp() {
        network = BaseNetworkMock()
        requester = Requester(network: network)
        repositoryManager = RepositoryManager(requester: requester)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        repositoryManager.productRepository.productList().subscribe(onNext: { (list) in
            print(list)
        })
        waitForExpectations(timeout: 1) { error in
                   if let error = error {
                       XCTFail("waitForExpectationsWithTimeout errored: \(error)")
                   }
               }
        

    }
    
}
