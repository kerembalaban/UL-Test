//
//  Post.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation

struct Post:Codable {
    let userId:Int
    let id:Int
    let title:String
    let body:String
}
