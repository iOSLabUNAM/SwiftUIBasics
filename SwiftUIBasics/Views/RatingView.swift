//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI



struct RatingView: View {
    @State var statusStar1: Bool = false
    @State var statusStar2: Bool = false
    @State var statusStar3: Bool = false
    @State var statusStar4: Bool = false
    @State var statusStar5: Bool = false
    var body: some View {
        HStack{
            Button(){
                statusStar1.toggle()
            }label: {
                Image(systemName: statusStar1 ? "star.fill": "star")
                    .font(.largeTitle)
            }
            Button(){
                statusStar2.toggle()
                statusStar1.toggle()
            }label: {
                Image(systemName: statusStar2 ? "star.fill": "star")
                    .font(.largeTitle)
            }
            Button(){
                statusStar1.toggle()
                statusStar2.toggle()
                statusStar3.toggle()
            }label: {
                Image(systemName: statusStar3 ? "star.fill": "star")
                    .font(.largeTitle)
            }
            Button(){
                statusStar1.toggle()
                statusStar2.toggle()
                statusStar3.toggle()
                statusStar4.toggle()
            }label: {
                Image(systemName: statusStar4 ? "star.fill": "star")
                    .font(.largeTitle)
            }
            Button(){
                statusStar1.toggle()
                statusStar2.toggle()
                statusStar3.toggle()
                statusStar4.toggle()
                statusStar5.toggle()
            }label: {
                Image(systemName: statusStar5 ? "star.fill": "star")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    RatingView()
}
