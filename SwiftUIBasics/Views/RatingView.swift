import SwiftUI
struct StarRatingView: View {
    @State private var rating: Int = 0

    var body: some View {
        VStack {
            Text("Selected Rating: \(rating)")

            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= self.rating ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            self.rating = index
                        }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView()
    }
}

