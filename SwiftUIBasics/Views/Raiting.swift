import SwiftUI

struct Rating: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(index <= rating ? .yellow : .gray)
                    .onTapGesture {
                        // Si la estrella ya está seleccionada, establece la clasificación a 0
                        self.rating = index == self.rating ? 0 : index
                    }
            }
        }
        
    }
    
    struct ContentView: View {
        @State private var rating = 0
        
        var body: some View {
            VStack {
                Text("Rating: \(rating)")
                    .padding()
                
                Rating(rating: $rating)
                    .padding()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
