//
//  TopBarUIView.swift
//  EccomerceShop
//
//  Created by Hüseyin Umut Kardaş on 16.11.2024.
//

import SwiftUI

struct TopBarUIView: View {
    @Environment(\.dismiss) var dismiss

    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image("appMenuIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.08, height: screenHeight * 0.05)
            }

            Spacer()

            HStack {
                Image("bagIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.08, height: screenHeight * 0.05)

                Image("messageIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.08, height: screenHeight * 0.05)
            }
            .padding(.horizontal, screenWidth * 0.025)
            .background(.white)
            .cornerRadius(25)
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.gray.opacity(0.1), lineWidth: 1)
            }
        }
    }
}

#Preview {
    ZStack {
        Color("backgroundColor")
            .ignoresSafeArea()
        VStack {
            TopBarUIView()
            Spacer()
        }
    }
}
