//
//  Model.swift
//  TableViewSectionDemo
//
//  Created by Kushal Rana on 20/04/23.
//

import Foundation
 

struct ProductModel: Decodable {
    var products : [Products]
}

struct Products: Decodable {
    let title : String?
    let price : Int?
    let brand : String?
    let description : String?
    let thumbnail : String?
    let discountPercentage: Double?
    let images: [String]
    let category: String?
}

