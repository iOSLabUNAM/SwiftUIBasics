//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    @State var rating: Int = 0
    var body: some View {
        HStack{
            ForEach((1..<6)) { idx in
                Image(systemName: (rating >= idx) ? "star.fill": "star")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        if rating == idx {
                            rating = 0
                        } else {
                            rating = idx
                        }
                    }
            }
        }
    }
}

#Preview {
    RatingView()
}
