//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack{
            Text("Choose")
            Text("Your plane")
        }
        .font(.title)
        .fontWeight(.bold)
        .padding(.bottom, 9)
        
        HStack{
            ZStack{
                Rectangle().frame(width: 150, height: 150)
                    .foregroundStyle(.purple)
                    .clipShape(
                        .rect(cornerRadius: 10)
                    )
                Letters(plan: "Basic", price: 9, color: .white)
                
            }
            VStack{
                ZStack{
                    Rectangle().frame(width: 150, height: 150)
                        .foregroundStyle(.gray)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .clipShape(
                            .rect(cornerRadius: 10)
                        )
                    Letters(plan: "Pro", price: 19, color: .black)
                    
                }
                .padding(.bottom, -20)
                Message(message: "Best for designer", whidth: 120, height: 20)
            }
        }
        .padding(.bottom, 9)
        VStack{
            ZStack{
                
                Rectangle().frame(width: 320, height: 160)
                    .foregroundStyle(.black)
                    .opacity(0.7)
                    .clipShape(
                        .rect(cornerRadius: 10)
                    )
                VStack{
                    Image(systemName: "wand.and.rays")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(maxWidth: 30, maxHeight: 30)
                    Letters(plan : "Team" , price: 299, color: .white)
                }
            }
            .padding(.bottom , -10)
            Message(message: "Perfect for tema 20 members", whidth: 280, height: 20)
        }
    }
    
}

struct Message : View{
    @State var message : String
    @State var whidth : CGFloat
    @State var height : CGFloat
    var body: some View {
        ZStack{
            Rectangle().frame(width: whidth, height: height)
                .foregroundStyle(.orange)
            Text("\(message)")
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
    
    
}

struct Letters : View {
    @State var plan : String
    @State var price : Int
    @State var color : Color
    var body: some View {
        VStack{
            Text("\(plan)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("$\(price)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("per mount")
                .font(.subheadline)
        }
        .fontWeight(.bold)
        .foregroundStyle(color)
    }
}

#Preview {
    PlansView()
}
