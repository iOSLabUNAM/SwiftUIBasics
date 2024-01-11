//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    @State var rating: Int? = 0
    @State private var animate = false
        
        private func starType(index: Int) -> String {
            
            if let rating = self.rating {
                return index <= rating ? "star.fill" : "star"
            } else {
                return "star"
            }
        }
        
        var body: some View {
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: self.starType(index: index))
                        .symbolEffect(.bounce, value: animate)
                        .contentTransition(.symbolEffect(.replace))
                        .foregroundColor(Color.orange)
                        .onTapGesture {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            if self.rating != index{
                                self.rating = index
                            } else { self.rating = index-1}
                    }
                }
            }
        }
}

#Preview {
    RatingView()
}
