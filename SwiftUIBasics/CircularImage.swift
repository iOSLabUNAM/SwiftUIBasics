//
//  CircularImage.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 08/12/23.
//

import SwiftUI

struct CircularImage: View {
    var imageName: String
    var size: CGFloat = 92
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size)
            .clipShape(.circle)
            .overlay{
                Circle()
                    .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircularImage(imageName: "karen", size: 200)
}
