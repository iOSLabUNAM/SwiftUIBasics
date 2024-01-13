//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    @State var isPressedOne = false
    @State var isPressedTwo = false
    @State var isPressedThree = false
    @State var isPressedFour = false
    @State var isPressedFive = false
    var body: some View {
        HStack{
            Button{
                isPressedOne.toggle()
            }label: {
                
                Image(systemName: isPressedOne ? "star.fill" : "star")
                    .font(.largeTitle)
            }
            Button{
                isPressedOne.toggle()
                isPressedTwo.toggle()
                
            }label: {
                
                Image(systemName: isPressedTwo ? "star.fill" : "star")
                    .font(.largeTitle)
            }
            Button{
                isPressedOne.toggle()
                isPressedTwo.toggle()
                isPressedThree.toggle()
            }label: {
                Image(systemName: isPressedThree ? "star.fill" : "star")
                    .font(.largeTitle)
            }
            Button{
                isPressedOne.toggle()
                isPressedTwo.toggle()
                isPressedThree.toggle()
                isPressedFour.toggle()
            }label: {
                Image(systemName: isPressedFour ? "star.fill" : "star")
                    .font(.largeTitle)
            }
            Button{
                isPressedOne.toggle()
                isPressedTwo.toggle()
                isPressedThree.toggle()
                isPressedFour.toggle()
                isPressedFive.toggle()
            }label: {
                Image(systemName: isPressedFive ? "star.fill" : "star")
                    .font(.largeTitle)
            }

        }
    }
}

#Preview {
    RatingView()
}
