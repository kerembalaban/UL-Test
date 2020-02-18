//
//  UL_TestTests.swift
//  UL-TestTests
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import XCTest
import UL_BackendService
@testable import UL_Test

class UL_TestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchUsers(){
        let expectation = self.expectation(description: "Network call")
        BackendService.sharedInstance.fetchUserList { (users, error) in
            if error == nil {
                
            }else{
                XCTFail(error!.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchPosts(){
        let expectation = self.expectation(description: "Network call")
        BackendService.sharedInstance.fetchPostBySelectedUser(id: 1, completion: { (posts, error) in
            if error == nil {
                
            }else{
                XCTFail(error!.localizedDescription)
            }
            expectation.fulfill()
        })
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchComments(){
        let expectation = self.expectation(description: "Network call")
        BackendService.sharedInstance.fetchCommentsBySelectedPost(id: 1, completion: { (comments, error) in
            if error == nil {
                
            }else{
                XCTFail(error!.localizedDescription)
            }
            expectation.fulfill()
        })
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchAlbums(){
        let expectation = self.expectation(description: "Network call")
        BackendService.sharedInstance.fetchAlbumsBySelectedUser(id: 1, completion: { (albums, error) in
            if error == nil {
                
            }else{
                XCTFail(error!.localizedDescription)
            }
            expectation.fulfill()
        })
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchPhotos(){
        let expectation = self.expectation(description: "Network call")
        BackendService.sharedInstance.fetchPhotosBySelectedAlbum(id: 1, completion: { (photos, error) in
            if error == nil {
                
            }else{
                XCTFail(error!.localizedDescription)
            }
            expectation.fulfill()
        })
        waitForExpectations(timeout: 1, handler: nil)
    }
}
