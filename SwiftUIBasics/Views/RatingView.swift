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
        VStack{
            Text("How you rate this?")
                .font(.title)
                .fontWeight(.heavy)
                .fontDesign(.rounded)
            
            HStack {
                ForEach(1..<6) { index in
                    Image(systemName: rating >= index ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(rating >= index ? .yellow : .gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
            
            Text("Current rating: \(rating)")
                .font(.subheadline)
                .fontWeight(.heavy)
                .fontDesign(.rounded)
                .padding()
        }
    }
}

#Preview {
    RatingView()
}
