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
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.starImageName(index: index))
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(self.starColor(index: index))
                    .onTapGesture {
                        self.toggleStar(index: index)
                    }
            }
        }
        .padding()
    }

    private func starImageName(index: Int) -> String {
        return index <= self.rating ? "star.fill" : "star"
    }

    private func starColor(index: Int) -> Color {
        return index <= self.rating ? .yellow : .gray
    }

    private func toggleStar(index: Int) {
        if index == self.rating {
            self.rating = 0
        } else {
            self.rating = index
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
