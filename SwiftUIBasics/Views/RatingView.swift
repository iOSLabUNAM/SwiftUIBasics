

import SwiftUI

 struct RatingView: View {
     @State private var rating = 0
     private var starColor = Color(hue: 0.1333, saturation: 0.94, brightness: 0.97)
     var body: some View {
         VStack {
             
             HStack{
                 ForEach (1...5, id: \.self) { index in
                     Image(systemName: index <= self.rating ? "star.fill" : "star")
                         .resizable()
                         .frame(width: 35, height: 35)
                         .foregroundStyle(starColor)
                         .onTapGesture {
                             if index == self.rating {
                                 self.rating = 0
                             } else {
                                 self.rating = index
                             }
                         }
                 }
             }
         }
         .padding()
     }
 }

#Preview {
    RatingView()
}
