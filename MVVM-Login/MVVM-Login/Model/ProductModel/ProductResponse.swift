//
//  ProductResponse.swift
//  MVVM-Login
//
//  Created by Dhanush S on 07/02/23.
//

import Foundation

// MARK: - ProductResponse
struct ProductResponse : Decodable{
    let data: ProductResponseData?
}

// MARK: - ProductResponseData
struct ProductResponseData: Decodable {
    let products: [Product]?
}

// MARK: - Product
struct Product : Decodable {
    let id, brand, productName, productDescription: String
    let price, offerPrice: String
    let productURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, brand, price, offerPrice
        case productName = "name"
        case productDescription = "productDesc"
        case productURL = "productUrl"
    }
}
