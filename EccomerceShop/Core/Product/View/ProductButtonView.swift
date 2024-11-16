//
//  ProductButtonView.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import SwiftUI

struct ProductButtonView<Content: View>: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var action: () -> Void
    var color: Color
    var lineColor: Color
    var content: Content

    var body: some View {
        Button {
            action()
        } label: {
            content
        }
        .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.width * 0.2)
        .blur(radius: 0.02)
        .background(color)
        .cornerRadius(25)
        .overlay {
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineColor, lineWidth: 0.5)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
            .ignoresSafeArea()

        ProductButtonView(action: {}, color: .white.opacity(0.2), lineColor: .white, content: Text("Add")
            .foregroundStyle(.white))
    }
}
