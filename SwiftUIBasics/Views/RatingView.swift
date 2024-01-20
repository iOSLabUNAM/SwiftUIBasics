//
//  ContentView.swift
//  ExercisesUI
//
//  Created by Diplomado  on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Int = 0
    
    
    var body: some View {
        HStack {
            ForEach((1..<6)) { index in
                Image(systemName: (rating >= index) ? "star.fill" : "star")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .onTapGesture {
                        if rating == index {
                            rating = 0
                        } else {
                            rating = index
                        }
                    }
            }
        }
    }
    
}




#Preview {
    RatingView()
}



