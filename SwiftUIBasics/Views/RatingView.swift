//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    @State var isStar1Filled : Bool =  false
    @State var isStar2Filled : Bool =  false
    @State var isStar3Filled : Bool =  false
    @State var isStar4Filled : Bool =  false
    @State var isStar5Filled : Bool =  false
    var body: some View {
        HStack {
            Button {
                isStar1Filled.toggle()
            }label: {
                Image(systemName: isStar1Filled ? "star.fill" : "star")
            }
            
            Button {
                isStar1Filled.toggle()
                isStar2Filled.toggle()
            }label: {
                Image(systemName: isStar2Filled ? "star.fill" : "star")
            }
            
            Button {
                isStar1Filled.toggle()
                isStar2Filled.toggle()
                isStar3Filled.toggle()
            }label: {
                Image(systemName: isStar3Filled ? "star.fill" : "star")
            }
            
            Button {
                isStar1Filled.toggle()
                isStar2Filled.toggle()
                isStar3Filled.toggle()
                isStar4Filled.toggle()
            }label: {
                Image(systemName: isStar4Filled ? "star.fill" : "star")
            }
            
            Button {
                isStar1Filled.toggle()
                isStar2Filled.toggle()
                isStar3Filled.toggle()
                isStar4Filled.toggle()
                isStar5Filled.toggle()
            }label: {
                Image(systemName: isStar5Filled ? "star.fill" : "star")
            }
        }
    }
}

#Preview {
    RatingView()
}
