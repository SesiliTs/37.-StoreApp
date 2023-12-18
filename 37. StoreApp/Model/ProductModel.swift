//
//  ProductModel.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import Foundation

struct ProductData: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable, Hashable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    var stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    var chosenQuantity: Int? = 0
}
