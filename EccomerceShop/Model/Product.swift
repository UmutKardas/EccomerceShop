//
//  Product.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import Foundation

struct Product: Identifiable {
    var id: String
    var name: String
    var description: String
    var category: Categories
    var liked: Bool
    var price: Double
    var image: String

    init(id: String = UUID().uuidString, name: String, description: String, category: Categories, liked: Bool = false, price: Double, image: String) {
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.liked = liked
        self.price = price
        self.image = image
    }
}
