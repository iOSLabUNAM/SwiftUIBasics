//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack(alignment:.center){
            Text("Choose")
                .font(.system(size: 32, weight: .black, design: .serif))
                .fontDesign(.rounded)
            Text("Your Plan")
                .font(.system(size: 32, weight: .black, design: .serif))
                .fontDesign(.rounded)
            HStack {
                CardView(iconName: "", title: "Basic", description: "Per month", price: "$9")
                    .foregroundStyle(.white)
                    .background(.purple)
                    .cornerRadius(6.0)
                ZStack {
                    CardView(iconName: "", title: "Pro", description: "Per month", price: "$19")
                        .background(.gray)
                        .cornerRadius(6.0)
                    BadgeView(text: "Best for designer", padding: 5)
                        .foregroundStyle(.white)
                        .background(.orange)
                        .padding(.top, 200)
                }
            }
            VStack {
                CardView(iconName: "sparkles", title: "Team", description:     "                    Per month                   ", price: "299")
                    .background(.black)
                    .foregroundStyle(.white)
                    .cornerRadius(6.0)
                BadgeView(text: "Perfect for teams with 20 memebers", padding: 5)
                    .foregroundStyle(.white)
                    .background(.orange)
                    .padding(.top, -30)

            }
        }
        
        
    }
}


#Preview {
    ContentView2()
}

struct CardView: View {
    var iconName: String
    var title: String
    var description: String
    var price: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: iconName)
                .font(.system(size: 40))
                .padding(.top, 30)
                .padding(.bottom, -15)
            VStack(spacing: 10) {
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .padding(.bottom, -25)
                Text(price)
                    .fontWeight(.bold)
                    .font(.system(size: 40, design: .rounded))
                Text(description)
                    .padding(.horizontal,40)
                    .padding(.vertical)
                    .padding(.bottom)
            }
        }
    }
        
}

struct BadgeView: View {
    var text: String
    var padding: CGFloat
    
    
    var body: some View {
        Text(text)
            .padding(padding)
            
    }
}
