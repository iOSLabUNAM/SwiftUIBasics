//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading) {
                Text("Choose")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Text("Your Plan")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }
            HStack(spacing: 10) {
                VStack {
                    Text("Basic")
                        .padding(.top, 50)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Text("$9")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Text("per month")
                        .padding(.bottom, 50)
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                ZStack {
                    VStack {
                        Text("Pro")
                            .padding(.top, 50)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("$19")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("per month")
                            .padding(.bottom, 50)
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("Best for designers")
                        .padding(5)
                        .background(Color.yellow)
                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .offset(CGSize(width: 0.0, height: 89.0))
                }
            }
            ZStack {
                VStack {
                    Image(systemName: "wand.and.rays")
                        .font(.system(size: 26))
                        .padding(.top, 50)
                        .foregroundColor(.white)
                    Text("Team")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Text("$299")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Text("per month")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Perfect for teams with 20 members")
                    .padding(5)
                    .background(Color.yellow)
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .offset(CGSize(width: 0.0, height: 105.0))
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .background(Color.clear)
    }
}

#Preview {
    PlansView()
}
