//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Eric Margay on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    private let maxStars = 5
    @State private var starCount: Int = 0
    
    var body: some View {
        HStack {
            ForEach(1...maxStars, id: \.self) { star in
                Image(systemName: star <= starCount ? "star.fill" : "star")
                    .onTapGesture {
                        self.starCount = self.starCount == star ? 0 : star
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
