//
//  CategoryItemView.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import SwiftUI

struct CategoryItemView: View {
    @Binding var currentCategory: Categories

    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var category: Categories

    var body: some View {
        Button {
            withAnimation {
                currentCategory = category
            }
        } label: {
            HStack {
                Image(category.categories.1)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.08, height: screenHeight * 0.05)
                    .foregroundColor(currentCategory == category ? .black : .gray)

                Text("\(category.categories.0)")
                    .font(.system(size: screenWidth * 0.04, weight: .regular))
                    .foregroundColor(currentCategory == category ? .black : .gray)
            }
        }
        .padding(.horizontal, screenWidth * 0.025)
        .background(currentCategory == category ? Color("purpleColor") : .white)
        .cornerRadius(25)
    }
}

#Preview {
    ZStack {
        Color("backgroundColor")
            .ignoresSafeArea()
        CategoryItemView(currentCategory: .constant(.All), category: .Footwear)
    }
}
