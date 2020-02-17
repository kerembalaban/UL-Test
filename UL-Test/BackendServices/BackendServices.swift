//
//  BackendServices.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation
import Alamofire

struct BackendService{
    static let sharedInstance: BackendService = BackendService()
    let SERVICE_ERROR_MESSAGE = "There is an unknown error, try again"
    let INTERNET_CONNECTION_MESSAGE = "Please check your internet connection"
    let SERVICE_URL = "https://jsonplaceholder.typicode.com/"
    
    func fetchUserList(completion: @escaping ([User],Error?) -> Void) {
        if (!ConnectionUtils.sharedInstance.isInternetAvailable()){
            completion([],NSError(domain: self.INTERNET_CONNECTION_MESSAGE, code: 1000, userInfo: nil))
        }
        
        let urlString = SERVICE_URL + "users"
        AF.request(urlString).response { response in
            guard let data = response.data else {
                return completion([],NSError(domain: self.SERVICE_ERROR_MESSAGE, code: 1000, userInfo: nil))
            }
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                completion(users,nil)
            } catch let error {
                 completion([],error)
            }
        }
    }
    
    func fetchPostBySelectedUser(id:Int, completion: @escaping ([Post],Error?) -> Void) {
        if (!ConnectionUtils.sharedInstance.isInternetAvailable()){
            completion([],NSError(domain: self.INTERNET_CONNECTION_MESSAGE, code: 1000, userInfo: nil))
        }
        
        let urlString = SERVICE_URL + "posts"
        AF.request(urlString).response { response in
            guard let data = response.data else {
                return completion([],NSError(domain: self.SERVICE_ERROR_MESSAGE, code: 1000, userInfo: nil))
            }
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                
                let filteredPosts = posts.filter {
                    $0.userId == id
                }
                
                completion(filteredPosts,nil)
            } catch let error {
                completion([],error)
            }
        }
    }
    
    func fetchCommentsBySelectedPost(id:Int, completion: @escaping ([Comment],Error?) -> Void) {
        if (!ConnectionUtils.sharedInstance.isInternetAvailable()){
            completion([],NSError(domain: self.INTERNET_CONNECTION_MESSAGE, code: 1000, userInfo: nil))
        }
        
        let urlString = SERVICE_URL + "comments"
        AF.request(urlString).response { response in
            guard let data = response.data else {
                return completion([],NSError(domain: self.SERVICE_ERROR_MESSAGE, code: 1000, userInfo: nil))
            }
            do {
                let decoder = JSONDecoder()
                let comments = try decoder.decode([Comment].self, from: data)
                
                let filteredComments = comments.filter {
                    $0.postId == id
                }
                
                completion(filteredComments,nil)
            } catch let error {
                completion([],error)
            }
        }
    }
    
    func fetchAlbumsBySelectedUser(id:Int, completion: @escaping ([Album], Error?) -> Void) {
        if (!ConnectionUtils.sharedInstance.isInternetAvailable()){
            completion([],NSError(domain: self.INTERNET_CONNECTION_MESSAGE, code: 1000, userInfo: nil))
        }
        
        let urlString = SERVICE_URL + "albums"
        AF.request(urlString).response { response in
            guard let data = response.data else {
                return completion([],NSError(domain: self.SERVICE_ERROR_MESSAGE, code: 1000, userInfo: nil))
            }
            do {
                let decoder = JSONDecoder()
                let albums = try decoder.decode([Album].self, from: data)
                
                let filteredAlbums = albums.filter {
                    $0.userId == id
                }
                
                completion(filteredAlbums,nil)
            } catch let error {
                completion([],error)
            }
        }
    }
    
    func fetchPhotosBySelectedAlbum(id:Int, completion: @escaping ([Photo],Error?) -> Void) {
        if (!ConnectionUtils.sharedInstance.isInternetAvailable()){
            completion([],NSError(domain: self.INTERNET_CONNECTION_MESSAGE, code: 1000, userInfo: nil))
        }
        
        let urlString = SERVICE_URL + "photos"
        AF.request(urlString).response { response in
            guard let data = response.data else {
                return completion([],NSError(domain: self.SERVICE_ERROR_MESSAGE, code: 1000, userInfo: nil))
            }
            do {
                let decoder = JSONDecoder()
                let photos = try decoder.decode([Photo].self, from: data)
                
                let filteredPhoto = photos.filter {
                    $0.albumId == id
                }
                
                completion(filteredPhoto,nil)
            } catch let error {
                completion([],error)
            }
        }
    }
    
}
