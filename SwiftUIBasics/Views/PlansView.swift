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
            VStack {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }

            HStack{
                
                VStack{
                    Text("Basic")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text("$9")
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Text("per month")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(40)
                .background(Color(.purple))
                .cornerRadius(10)
                
                ZStack{
                    VStack{
                        Text("Pro")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.black)
                        Text("$19")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                        Text("per month")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .padding(40)
                    .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                    .cornerRadius(10)
                    
                    Text("Best for designer")
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 90)
                        .foregroundColor(.white)
                }
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(red: 62/255, green: 63/255, blue: 70/255))
                    .frame(width: 360, height: 222)
                
                VStack{
                    Image(systemName: "wand.and.rays")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("Team")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text("$299")
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Text("per month")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Text("Perfect for teams with 20 members")
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
            }

        }
    }
}

#Preview {
    PlansView()
}
