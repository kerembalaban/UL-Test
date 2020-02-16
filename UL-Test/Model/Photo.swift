//
//  Photo.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation

struct Photo:Codable {
    let albumId:Int
    let id:Int
    let title:String
    let url:String
    let thumbnailUrl:String
}
