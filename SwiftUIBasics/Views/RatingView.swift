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
        Text("Rating")
        
        HStack{
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .onTapGesture {
                        if (rating.self == index){
                            rating.self = 0
                        } else {
                            rating.self = index
                        }
                        
                        print(rating)
                    }
                    
            }
        }
    }
}

#Preview {
    RatingView()
}
