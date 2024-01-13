//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    @State var selected = 0
    var body: some View {
        Text("Rating Star")
            .padding()
        
        HStack{
            ForEach(0..<5){i in
                Image(systemName: i <= selected ? "star.fill":"star")
                    .resizable()
                    .foregroundStyle(i <= selected ? .yellow:.black)
                    .frame(width: 40,height: 40).onTapGesture {
                        selected = i
                        
                    }
            }
            
            
        }
        
        
    }
}

#Preview {
    RatingView()
}
