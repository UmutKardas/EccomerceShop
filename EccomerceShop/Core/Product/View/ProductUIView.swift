//
//  ProductUIView.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import SwiftUI

struct ProductUIView: View {
    @State var count: Int = 1
    @Binding var product: Product

    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            Image("productBackground")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            VStack {
                // MARK: - Top Bar

                TopBarUIView()

                Spacer()

                // MARK: - Buttons

                VStack(spacing: screenHeight * 0.04) {
                    ProductButtonView(action: { product.liked.toggle() },
                                      color: .white.opacity(0.2),
                                      lineColor: .white,
                                      content:
                                      Image(systemName: product.liked ? "heart.fill" : "heart")
                                          .resizable()
                                          .scaledToFit()
                                          .foregroundStyle(product.liked ? .red : .white)
                                          .frame(width: screenWidth * 0.07, height: screenWidth * 0.06))

                    VStack {
                        ProductButtonView(action: { count += 1 },
                                          color: .white.opacity(0.2),
                                          lineColor: .white,
                                          content:
                                          Image(systemName: "plus")
                                              .resizable()
                                              .scaledToFit()
                                              .foregroundStyle(.white)
                                              .frame(width: screenWidth * 0.07, height: screenWidth * 0.06))

                        Text("\(count)")
                            .foregroundStyle(.white)
                            .font(.system(size: screenWidth * 0.06, weight: .bold))

                        ProductButtonView(action: { count = max(count - 1, 0) },
                                          color: .white.opacity(0.2),
                                          lineColor: .white,
                                          content:
                                          Image(systemName: "minus")
                                              .resizable()
                                              .scaledToFit()
                                              .foregroundStyle(.white)
                                              .frame(width: screenWidth * 0.07, height: screenWidth * 0.06))
                    }
                    ProductButtonView(action: {},
                                      color: Color("redColor"),
                                      lineColor: Color("redColor"),
                                      content:
                                      HStack {
                                          Text("Add")
                                          Image(systemName: "arrow.forward")
                                              .resizable()
                                              .scaledToFit()
                                              .frame(width: screenWidth * 0.04, height: screenWidth * 0.03)
                                      }
                                      .foregroundStyle(.white)
                                      .frame(width: screenWidth * 0.2, height: screenWidth * 0.06))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Spacer()

                // MARK: - Product Details

                VStack(alignment: .leading, spacing: screenHeight * 0.02) {
                    Text("\(product.name)")
                        .foregroundStyle(.white)
                        .font(.system(size: screenWidth * 0.06, weight: .medium))
                        .multilineTextAlignment(.leading)

                    HStack {
                        Text("\(product.description)")
                            .foregroundStyle(.white)
                            .font(.system(size: screenWidth * 0.04, weight: .light))
                            .multilineTextAlignment(.leading)

                        Spacer()

                        Text("$\(product.price, specifier: "%.0f")")
                            .font(.system(size: screenWidth * 0.09))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, screenWidth * 0.06)
        }
    }
}

#Preview {
    ProductUIView(product: .constant(Product(name: "A pretty peach mug", description: "A vibrant peach-colored mug perfect for your morning coffee.", category: .Shirts, price: 20, image: "product1Icon")))
}
