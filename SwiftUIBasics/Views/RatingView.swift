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
            Text("Rating")
                .font(.title)
                .fontWeight(.bold)
            HStack{
                ForEach (1...5, id: \.self) { index in
                    Image(systemName: index <= self.rating ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                        .onTapGesture {
                            if index == self.rating {
                                self.rating = 0
                            } else {
                                self.rating = index
                            }
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    RatingView()
}
