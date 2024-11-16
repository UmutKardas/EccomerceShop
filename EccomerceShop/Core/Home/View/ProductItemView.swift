//
//  ProductItemView.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import SwiftUI

struct ProductItemView: View {
    @State var isProductViewPresented: Bool = false
    @Binding var product: Product
    var index: Int

    private let colorArray: [Color] = [Color("purpleColor"), Color("blueColor"), Color("beigeColor"), Color("lightBeigeColor")]
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        Button {
            isProductViewPresented.toggle()
        } label: {
            VStack {
                // MARK: - Like Button

                Button {
                    product.liked.toggle()
                } label: {
                    Image(systemName: product.liked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(product.liked ? .red : .white)
                        .frame(width: screenWidth * 0.05, height: screenHeight * 0.03)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Spacer()

                // MARK: - Image

                Image("\(product.image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.4, height: screenHeight * 0.15)

                Spacer()

                // MARK: - Product Info

                VStack {
                    Text("\(product.name)")
                        .font(.system(size: screenWidth * 0.035))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("$\(product.price, specifier: "%.0f")")
                        .font(.system(size: screenWidth * 0.075))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(screenWidth * 0.03)
        }
        .frame(width: screenWidth * 0.43, height: screenHeight * 0.3)
        .background(colorArray[index % colorArray.count])
        .cornerRadius(30)
        .fullScreenCover(isPresented: $isProductViewPresented) {
            ProductUIView(product: $product)
        }
    }
}

#Preview {
    ProductItemView(product: .constant(Product(name: "A pretty peach mug", description: "A vibrant peach-colored mug perfect for your morning coffee.", category: .Shirts, price: 20, image: "product1Icon")), index: 0)
}
