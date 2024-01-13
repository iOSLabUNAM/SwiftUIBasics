//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Tere Durán on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.purple)
                        .frame(height: 200)
                    VStack {
                        Text("Basic")
                            .bold()
                            .font(.system(.title, design: .rounded))
                        Text("$9")
                            .bold()
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                        Text("per month")
                            .font(.headline)
                    }
                    .foregroundColor(Color.white)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .frame(height: 200)
                    VStack {
                        Text("Pro")
                            .bold()
                            .font(.system(.title, design: .rounded))
                        Text("$19")
                            .bold()
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                        Text("per month")
                            .font(.headline)
                    }
                    .foregroundColor(Color.black)
                    
                    Text("Best for designer")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                            .offset(x: 0, y: 98)
                }
            }
            .padding()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(red: 62/255, green: 63/255, blue: 70/255))
                    .frame(width: 360, height: 222)
                VStack {
                    Image(systemName: "wand.and.rays")
                        .font(.largeTitle)
                    Text("Team")
                        .bold()
                        .font(.system(.title, design: .rounded))

                    Text("$299")
                        .bold()
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                    Text("per month")
                        .font(.headline)
                }
                .foregroundColor(Color.white)
                
                Text("Perfect for teams with 20 members")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 110)
            }
        }
    }
}

#Preview {
    PlansView()
}
