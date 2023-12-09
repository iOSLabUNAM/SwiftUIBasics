//
//  RatingView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        Text("Choose your plan")
            .padding(.bottom,5)
            .bold()
            .fontDesign(.rounded)
            .font(.title)
        
        VStack{
            HStack{
                VStack{
                    Text("Basic\n$9")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontDesign(.rounded)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(40)
                        .multilineTextAlignment(.center)
                    Text("per month")
                        .bold()
                        .fontDesign(.rounded)
                        .padding(.top,-50)
                        .padding(.bottom, 20)
                        .foregroundStyle(.white)
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(.purple))

                
                VStack{
                    Text("Pro\n$19")
                        .font(.title)
                        .fontDesign(.rounded)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(40)
                        .multilineTextAlignment(.center)
                    
                    Text("per month")
                        .bold()
                        .fontDesign(.rounded)
                        .padding(.top,-50)
                    
                    ZStack{
                        Text("best for designers")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }.background(RoundedRectangle(cornerRadius: 7).fill(.orange))
                        .offset(CGSize(width: 1.0, height: 10.0))
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray))
                
               
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            VStack{
                Image(systemName: "wand.and.rays.inverse")
                    .padding(.bottom, -20)
                    .padding(.top, 25)
                    .foregroundStyle(.white)
                    .font(.title)
                
                Text("Team\n$299")
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .padding(-50)
                    
                Text("per mounth")
                    .bold()
                    .fontDesign(.rounded)
                    .padding(.top,-20)
                    .foregroundStyle(.white)
                ZStack{
                    Text("Perfect for teams with 20 members")
                        .font(.caption)
                        .foregroundStyle(.white)
                }.background(RoundedRectangle(cornerRadius: 7).fill(.orange))
                    .offset(CGSize(width: 1.0, height: 10.0))
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(.gray))
        
            .padding()
            
        }
        .frame(maxWidth: .infinity)
        
        
    }
}

#Preview {
    RatingView()
}
