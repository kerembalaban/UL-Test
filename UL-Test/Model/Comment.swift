//
//  Comment.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation

struct Comment:Codable {
    let postId:Int
    let id:Int
    let name:String
    let email:String
    let body:String
}
