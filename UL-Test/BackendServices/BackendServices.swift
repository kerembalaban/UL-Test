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
    
    let SERVICE_URL = "https://jsonplaceholder.typicode.com/"
    
    func fetchUserList(completion: @escaping (Bool,String,[User]) -> Void) {
        let urlString = SERVICE_URL + "users"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                completion(true,"",users)
            } catch let error {
                 completion(false,error.localizedDescription,[])
            }
        }
    }
    
    func fetchPostBySelectedUser(id:Int, completion: @escaping (Bool,String,[Post]) -> Void) {
        let urlString = SERVICE_URL + "posts"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                
                let filteredPosts = posts.filter {
                    $0.userId == id
                }
                
                completion(true,"",filteredPosts)
            } catch let error {
                completion(false,error.localizedDescription,[])
            }
        }
    }
    
    func fetchCommentsBySelectedPost(id:Int, completion: @escaping (Bool,String,[Comment]) -> Void) {
        let urlString = SERVICE_URL + "comments"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let comments = try decoder.decode([Comment].self, from: data)
                
                let filteredComments = comments.filter {
                    $0.postId == id
                }
                
                completion(true,"",filteredComments)
            } catch let error {
                completion(false,error.localizedDescription,[])
            }
        }
    }
    
    func fetchAlbumsBySelectedUser(id:Int, completion: @escaping (Bool,String,[Album]) -> Void) {
        let urlString = SERVICE_URL + "albums"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let albums = try decoder.decode([Album].self, from: data)
                
                let filteredAlbums = albums.filter {
                    $0.userId == id
                }
                
                completion(true,"",filteredAlbums)
            } catch let error {
                completion(false,error.localizedDescription,[])
            }
        }
    }
    
    func fetchPhotosBySelectedAlbum(id:Int, completion: @escaping (Bool,String,[Photo]) -> Void) {
        let urlString = SERVICE_URL + "photos"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let photos = try decoder.decode([Photo].self, from: data)
                
                let filteredPhoto = photos.filter {
                    $0.albumId == id
                }
                
                completion(true,"",filteredPhoto)
            } catch let error {
                completion(false,error.localizedDescription,[])
            }
        }
    }
    
}
