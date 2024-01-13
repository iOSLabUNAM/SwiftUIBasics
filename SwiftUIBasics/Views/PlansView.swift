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
                .font(.largeTitle)
                .fontWeight(.heavy)
                .fontWidth(.condensed)
            Text("your plan")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .fontWidth(.condensed)
            }
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.purple)
                    .frame(width:170,height: 170)
                VStack{
                    Text("Basic")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontWidth(.condensed)
                    Text("$9")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontWidth(.condensed)
                    Text("per month")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWidth(.condensed)
                    
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.gray)
                    .opacity(0.2)
                    .frame(width:170,height: 170)
                VStack{
                    Text("Pro")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontWidth(.condensed)
                    Text("$19")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontWidth(.condensed)
                    Text("per month")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWidth(.condensed)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0, style: .continuous)
                            .fill(Color.orange)
                            .opacity(0.8)
                            .frame(width:100,height: 25)
                        Text("Best for designer")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .fontWidth(.compressed)
                    }
                }.padding(.top,40)
            }
        }
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.black)
                .opacity(0.75)
                .frame(width:350,height: 200)
            VStack{
                Image(systemName: "wand.and.rays")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWidth(.condensed)
                Text("Team")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontWidth(.condensed)
                Text("$299")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontWidth(.condensed)
                Text("per month")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontWidth(.condensed)
                ZStack{
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .fill(Color.orange)
                        .frame(width:200,height: 25)
                    Text("Perfect for teams with 20 members")
                        .foregroundStyle(.white)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .fontWidth(.compressed)
                        
                }
            }.padding(.top,15)
        }
        
    }
}

#Preview {
    PlansView()
}
