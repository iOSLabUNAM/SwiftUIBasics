//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var customColorLightGray = Color(red:240/255, green: 240/255, blue:240/255)
    var customColorDarkGray = Color(red:62/255, green:63/255, blue: 70/255)
    
    var body: some View {
        VStack(spacing:15){
            HeaderView()
            HStack(spacing:15){
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: customColorLightGray, subText: "Best for designer", subTextOffset: (x:0, y:87))
            }
            PricingView(title: "Team", price: "$299", textColor: .white, bgColor: customColorDarkGray , icon: "wand.and.rays", subText: "Perfect for teams with 20 members", subTextOffset: (x:0, y:110))
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 2) {
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
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    var subText: String?
    var subTextOffset: (x: CGFloat, y: CGFloat)?

    var body: some View {
        ZStack {
            VStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundStyle(textColor)
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
            .background(bgColor)
            .cornerRadius(10)
            
            if let subText = subText, let subTextOffset = subTextOffset {
                Text(subText)
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: subTextOffset.x, y: subTextOffset.y)
            }
        }
    }
}

#Preview {
    PlansView()
}
