//
//  AANetworkTests.swift
//  AANetworkTests
//
//  Created by Amir Ardalan on 4/1/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import XCTest
@testable import AANetwork
@testable import Domain

class AANetworkTests: XCTestCase {
    
    var networkWrapper : INetworkMockImp!
    // var mapper : AANetworkMapper!
    var netwrokDefault : NetworkRequest!
    var requester : Requester!
    
    override func setUp() {
        
        networkWrapper = INetworkMockImp()
        requester = Requester(network: networkWrapper)
        
    }
    
    override func tearDown() {
        
    }
    
    
    
    func test_check_Mapper_ObjectMApper(){
        let data = Mock.jsonData
        self.networkWrapper.setResult(result: stub_result(fail: true,data: data))
        let _expectation = expectation(description: "")
        let provider = DefaultNetworkProvider(endPoint: "http://google.com", method: .post, param: nil)
        requester.makeRequest(provider: provider, ofType: Response<String>.self, compelet: { (data) in
            XCTAssert(data != nil)
            _expectation.fulfill()
        }) { (error) in
            print(error)
            switch error {
            case let nerror  as NetworkError:
                print(nerror.localizedDescription)
            default:break
            }
            XCTAssert(error is NetworkError)
            _expectation.fulfill()
        }
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func test_BaseNetwork_Mock(){
        let base = BaseNetworkMock()
        let _expectation = expectation(description: "")
        base.load(url: "products", method: .post, payload: nil, decoder: .json) { (data) in
            switch data {
            case .success(let data):
                XCTAssert(data != nil)
                _expectation.fulfill()
            case .failure(let er):
                XCTAssert(er is NetworkError)
                _expectation.fulfill()
            }
            
        }
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func test_requester(){
        let data = Mock.jsonData
        self.networkWrapper.setResult(result: stub_result(fail: true,data: data))
        let provider = DefaultNetworkProvider(endPoint: "http://google.com", method: .post, param: nil)
        requester.makeRequest(provider: provider, ofType: Response<String>.self, compelet: { (data) in
            print(data)
        }) { (err) in
            print(err)
        }
    }
    
    
    func stub_result(fail:Bool,statusCode:Int = 400,error:Error? = nil,data:Data? = nil)->BaseNetworkCallBack {
        let result = BaseNetworkResult(status: statusCode, error: error , data: data ?? Mock.jsonData)
        if fail {
            return .failure(result)
        }else{
            return .success(result)
        }
    }
    
    
}
