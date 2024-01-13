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
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= self.rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(index <= self.rating ? .yellow : .gray)
                    .onTapGesture {
                        if index == self.rating {
                            // Si se hace clic en la estrella ya seleccionada, descolorearla
                            self.rating = 0
                        } else {
                            // De lo contrario, establecer la calificación según la estrella clicada
                            self.rating = index
                        }
                    }
            }
        }
        .padding()
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
