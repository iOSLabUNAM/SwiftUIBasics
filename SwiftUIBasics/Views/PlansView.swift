//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack() {
            VStack() {
                VStack(alignment: .leading) {
                    Text("Choose")
                    Text("Your plan")
                }
                .font(.largeTitle)
                .bold()
            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 170, height: 190)
                        .foregroundStyle(.purple)
                        .clipShape(.rect(cornerRadius: 10))
                    VStack {
                        Text("Basic")
                        Text("$9")
                        Text("per month")
                    }
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                }
                ZStack {
                    Rectangle()
                        .frame(width: 180, height: 190)
                        .foregroundStyle(.gray)
                        .opacity(0.3)
                        .clipShape(.rect(cornerRadius: 10))
                    VStack {
                        VStack {
                            Text("Pro")
                            Text("$19")
                            Text("per month")
                        }
                        .font(.title)
                        .bold()
                        ZStack {
                            Rectangle()
                                .frame(width: 130, height: 30)
                                .foregroundStyle(.yellow)
                            Text("Best for designer")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        
                    }
                    .padding(.top, 50)
                    
                }
            }
            .padding()
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 360, height: 220)
                        .opacity(0.6)
                        .clipShape(.rect(cornerRadius: 10))
                    VStack {
                        VStack {
                            Image(systemName: "wand.and.rays")
                            Text("Team")
                            Text("$299")
                            Text("per month")
                        }
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                        ZStack {
                            Rectangle()
                                .frame(width: 240, height: 30)
                                .foregroundStyle(.yellow)
                            Text("Perfect for teams with 20 members")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.top, 50)
                }
            }
        }
    }
}

#Preview {
    PlansView()
}
