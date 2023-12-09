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
            ZStack{
                Rectangle()
                    .fill(.bar)
                    .frame(width: 350, height: 200)
                    .cornerRadius(15)
                Text("Choose Your Plan")
                    .font(.system(size: 55))
                    .bold()
                    .multilineTextAlignment(.center)
            }
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue)
                        .frame(width: 177, height: 177)
                    VStack {
                        Text("Basic")
                            .font(.system(size: 35))
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("$9")
                            .font(.system(size: 35))
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("per month")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.red)
                        .frame(width: 177, height: 177)
                    VStack {
                        Text("Pro")
                            .font(.system(size: 35))
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("$19")
                            .font(.system(size: 35))
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("per month")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                        
                        ZStack {
                            Rectangle()
                                .fill(.orange)
                                .frame(width: 150, height: 20)
                                .offset(x:0, y:29)
                            Text("nowww")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                                .offset(x:0, y:29)
                        }
                        
                    }
                }
            }
            ZStack{
                Rectangle()
                    .fill(.gray)
                    .frame(width: 350, height: 200)
                    .cornerRadius(15)
                    .offset(x:0, y:20)
                VStack{
                    Image(systemName: "wand.and.stars.inverse")
                        .font(.system(size: 35))
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .offset(x:0, y:20)
                    Text("Team")
                        .font(.system(size: 35))
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .offset(x:0, y:20)
                    Text("$299")
                        .font(.system(size: 35))
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .offset(x:0, y:20)
                    Text("per month")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .offset(x:0, y:20)
                    ZStack {
                        Rectangle()
                            .fill(.orange)
                            .frame(width: 150, height: 20)
                            .offset(x:0, y:41)
                        Text("nowww")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .offset(x:0, y:41)
                    }
                }
            }
        }
    }
}

#Preview {
    PlansView()
}
