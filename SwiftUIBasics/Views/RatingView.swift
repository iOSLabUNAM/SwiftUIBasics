//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    @State private var rating = 0

    var body: some View {
        VStack {
            HStack {
                ForEach(1...5, id: \.self) { index in
                    starImage(for: index)
                        .onTapGesture {
                            handleTap(for: index)
                        }
                }
            }
        }
        .padding()
    }

    private func starImage(for index: Int) -> some View {
        Image(systemName: index <= rating ? "star.fill" : "star")
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundStyle(Color("starColor"))
    }

    private func handleTap(for index: Int) {
        rating = (index == rating) ? 0 : index
    }
}


#Preview {
    RatingView()
}
