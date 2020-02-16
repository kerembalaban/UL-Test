//
//  Album.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation

struct Album:Codable {
    
    let userId:Int
    let id: Int
    let title:String!
}
