//
//  Product.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 24/03/22.
//

import Foundation

//Mark:- Model class to list Product.json
struct Product: Codable {
    var name: String
    var image: String
    var type: String
    var prize: Int
}
