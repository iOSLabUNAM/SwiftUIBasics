//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack(spacing: 10) {
                PricingView(title: "Basic", textColor: .white, backgroundColor: .purple, price: "$9")
                
                ZStack {
                    PricingView(title: "Pro", textColor: .black, backgroundColor: Color(red: 240/255, green: 240/255, blue: 240/255), price: "$19")
                    
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(title: "Team", textColor: .white, backgroundColor: Color(red: 62/255, green: 63/255, blue: 70/255), price: "$299", icon: "wand.and.rays")
                    .padding()
                
                Text("Perfect for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110)
            }
            
            // Add a spacer
            Spacer()
        }
    }
}

#Preview {
    PlansView()
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var price: String
    var icon: String?
    
    var body: some View {
        VStack {
            
            if let icon = icon {
                
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
                
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}
