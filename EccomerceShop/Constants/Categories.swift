//
//  Categories.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import Foundation

enum Categories: String, CaseIterable {
    case All
    case Footwear
    case Shirts
    case Watch
    
    var categories: (Categories, String) {
        switch self {
        case .All:
            return (.All, "menuIcon")
        case .Footwear:
            return (.Footwear, "shoesIcon")
        case .Shirts:
            return (.Shirts, "cupIcon")
        case .Watch:
            return (.Watch, "watchIcon")
        }
    }
}
