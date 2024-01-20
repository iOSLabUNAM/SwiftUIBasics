//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack(alignment: .center){
            VStack(alignment: .leading){Text("Chose")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Your Plan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.purple)
                    .frame(width: 170, height: 170)
                    .overlay {
                        VStack(alignment: .center){
                            Text("Basic")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("$9")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("per month")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(width: 170, height: 170)
                        .opacity(0.2)
                        .overlay {
                            
                            VStack(alignment: .center){
                                Text("Pro")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Text("$19")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Text("per month")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                ZStack{
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 120, height: 20)
                                    Text("Best for disigner")
                                        .foregroundStyle(.white)
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                }
                            }.padding(.top, 50)
                        }
            }.padding()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .frame(width: 340, height: 170)
                .opacity(0.7)
                .overlay {
                    VStack(alignment: .center){
                        Image(systemName: "wand.and.rays")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Team")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("$299")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("per month")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        ZStack{
                            Rectangle()
                                .fill(Color.orange)
                                .frame(width: 250, height: 20)
                            Text("Perfect for teams with 20 members")
                                .foregroundStyle(.white)
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                    }.padding(.top, 30)
                }
        }
    }
}

#Preview {
    PlansView()
}
