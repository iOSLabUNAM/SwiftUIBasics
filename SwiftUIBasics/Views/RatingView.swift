//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Eric Margay on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    struct Star: Identifiable {
        let id: Int
        init(id: Int) {
            self.id = id
        }
    }
    private var stars = Array(1...5).map { Star(id: $0) }
    @State private var starCount: Int = 0
    
    var body: some View {
        HStack {
            ForEach(stars) {star in
                Image(systemName: star.id <= starCount ? "star.fill" : "star")
                    .onTapGesture {
                        self.starCount = self.starCount == star.id ? 0 : star.id
                    }
            }
        }
    }
}

#Preview {
    RatingView()
}
