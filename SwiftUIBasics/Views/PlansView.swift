//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct Plans: View{
    let hasImg: Bool
    let imgName: String
    let planName: String
    let planCost: Double
    let hasDesc: Bool
    let description: String
    let backColor: Color
    let fontColor: Color
    let sizesBack: CGSize
    var body: some View{
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .frame(width: sizesBack.width, height: sizesBack.height)
                .aspectRatio(contentMode: .fill)
                .foregroundStyle(backColor)
            VStack{
                if hasImg{
                    Image(systemName: imgName)
                    
                        .font(.largeTitle)
                }
                Text(planName)
                    .font(.title.bold())
                    .foregroundStyle(fontColor)
                Text("$\(planCost)")
                    .font(.title.bold())
                    .foregroundStyle(fontColor)
                Text("per month")
                    .font(.footnote)
                    .foregroundStyle(fontColor)
                if hasDesc{
                    Text(description)
                        .font(.footnote)
                        .padding(5)
                        .foregroundStyle(.white)
                        .background(.orange)
                    
                }
            }
        }
    }
}

struct PlansView: View {
    var body: some View {
            
        Text("Choose \n ur plan 🐥")
            .font(.title.bold())
            .foregroundStyle(.black)
            
        VStack{
            HStack{
                Plans(hasImg: false, imgName: "", planName: "Basic", planCost: 9.9, hasDesc: false, description: "", backColor: .purple, fontColor: .white, sizesBack: CGSize(width: 177, height: 177))
                Plans(hasImg: false, imgName: "", planName: "Pro", planCost: 19, hasDesc: true, description: "Best for designer", backColor: .gray, fontColor: .black, sizesBack: CGSize(width: 177, height: 177))
            }
            
            Plans(hasImg: true, imgName: "wand.and.stars", planName: "Team", planCost: 299, hasDesc: true, description: "Perfect for teams with 20 members", backColor: .gray, fontColor: .white, sizesBack: CGSize(width: 300, height: 177))
        }
    }
}

#Preview {
    PlansView()
}

