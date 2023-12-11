//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI


struct StartRaiting : View {
    @State private var raiting : Int = 0
    
    var body: some View {
        HStack{
            ForEach(1..<6){ index in
                Image(systemName: index <= raiting ? "star.fill" : "star" )
                    .foregroundStyle(.yellow)
                .onTapGesture {
                    raiting = index
                }
            }
        }
    }
}
#Preview {
    StartRaiting()
}

