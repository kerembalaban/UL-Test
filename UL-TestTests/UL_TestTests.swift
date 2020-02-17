//
//  UL_TestTests.swift
//  UL-TestTests
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import XCTest
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
        BackendService.sharedInstance.fetchUserList { (isSuccess, message, users) in
            if isSuccess{
                XCTAssertTrue(true)
            }else{
                XCTFail(message)
            }
        }
    }
    
    func testFetchPosts(){
        BackendService.sharedInstance.fetchPostBySelectedUser(id: 1) { (isSuccess, message, posts) in
            if isSuccess{
                XCTAssertTrue(true)
            }else{
                XCTFail(message)
            }
        }
    }
    
    func testFetchComments(){
        BackendService.sharedInstance.fetchCommentsBySelectedPost(id: 1) { (isSuccess, message, posts) in
            if isSuccess{
                XCTAssertTrue(true)
            }else{
                XCTFail(message)
            }
        }
    }
    
    func testFetchAlbums(){
        BackendService.sharedInstance.fetchAlbumsBySelectedUser(id: 1) { (isSuccess, message, albums) in
            if isSuccess{
                XCTAssertTrue(true)
            }else{
                XCTFail(message)
            }
        }
    }
    
    func testFetchPhotos(){
        BackendService.sharedInstance.fetchPhotosBySelectedAlbum(id: 1) { (isSuccess, message, photos) in
            if isSuccess{
                XCTAssertTrue(true)
            }else{
                XCTFail(message)
            }
        }
    }
}
