//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Int

    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")

    var body: some View {
        VStack {
            Text("Rate:")
                .font(.system(size: 111))
                .bold()
            HStack{
                ForEach(1..<6, id:\.self){ number in
                    Image(systemName:
                            image(for: number))
                        .font(.system(size: 45))
                        .foregroundColor(number > rating ?
                                         Color.gray : Color.yellow)
                        .onTapGesture {
                            rating = number
                        }
                }
            }
        }
    }

}

#Preview {
    RatingView(rating: 0)
}

func image(for number: Int) -> String {
    if number <= 5 {
        return "star"
    } else {
        return "star.fill"
    }
}
