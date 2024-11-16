//
//  HomeViewModel.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var selectedCategory: Categories = .All {
        didSet {
            filteredProducts = selectedCategory == .All ? products : products.filter { $0.category == selectedCategory }
        }
    }

    init() {
        products = [
            Product(name: "A pretty peach mug", description: "A vibrant peach-colored mug perfect for your morning coffee.", category: .Shirts, price: 20, image: "product1Icon"),
            Product(name: "Thermal Cup", description: "A high-quality thermal cup to keep your beverages hot or cold for hours.", category: .Shirts, price: 45, image: "product2Icon"),
            Product(name: "A Thermal Flask", description: "Stay hydrated with this sleek and durable thermal flask.", category: .Shirts, price: 55, image: "product3Icon"),
            Product(name: "A cute cat mug", description: "A charming mug featuring a cute cat design, perfect for animal lovers.", category: .Shirts, price: 20, image: "product4Icon"),
            Product(name: "Floral Dream Mug", description: "A delicate floral-themed mug for tea or coffee enthusiasts.", category: .Shirts, price: 20, image: "product1Icon"),
            Product(name: "Vintage Thermal Cup", description: "A stylish vintage-style thermal cup for keeping your drinks at the perfect temperature.", category: .Shirts, price: 45, image: "product2Icon"),
            Product(name: "Premium Stainless Flask", description: "A premium quality stainless steel flask, built for long-lasting use and temperature retention.", category: .Shirts, price: 55, image: "product3Icon"),
            Product(name: "Playful Paws Mug", description: "A playful mug featuring cute paws, perfect for animal lovers who enjoy a fun design.", category: .Shirts, price: 20, image: "product4Icon")
        ]

        selectedCategory = .All
    }
}
