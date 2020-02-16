//
//  File.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation

struct User:Codable{
    let id:Int
    let name:String
    let username:String
    let email:String
    let address:Address
    let phone:String
    let website:String
    let company:Company
}
