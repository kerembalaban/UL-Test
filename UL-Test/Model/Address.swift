//
//  Address.swift
//  UL-Test
//
//  Created by Kerem Balaban on 16.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import Foundation

struct Geo:Codable{
    let lat:String
    let lng:String
}

struct Address:Codable{
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo:Geo
}
