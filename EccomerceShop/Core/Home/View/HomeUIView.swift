//
//  HomeUIView.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 15.11.2024.
//

import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            
            VStack(spacing: screenHeight * 0.007) {
                // MARK: - Top Bar
                
                TopBarUIView()
                
                // MARK: - Search
                
                HStack {
                    Image("searchIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.06, height: screenHeight * 0.03)
                    
                    TextField("Search", text: $viewModel.searchText)
                }
                .padding()
                .background(.white)
                .cornerRadius(25)
                .padding(.top, screenHeight * 0.02)
                
                Spacer()
                
                // MARK: - Categories
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: screenWidth * 0.04) {
                        ForEach(Categories.allCases, id: \.self) { category in
                            CategoryItemView(currentCategory: $viewModel.selectedCategory, category: category)
                        }
                    }
                }
                
                Spacer()
                
                // MARK: - Products
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [.init(), .init()]) {
                        ForEach(Array(viewModel.filteredProducts.enumerated()), id: \.element.id) { index, _ in
                            ProductItemView(product: $viewModel.filteredProducts[index], index: index)
                        }
                    }
                }
            }
            .padding(.horizontal, screenWidth * 0.06)
        }
    }
}

#Preview {
    HomeUIView()
}
