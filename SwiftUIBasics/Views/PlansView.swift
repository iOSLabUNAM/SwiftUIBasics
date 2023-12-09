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
            VStack(alignment:.leading){
                Text("Choose")
                Text("Your Plan")
            }
            .font(.title)
            //.font(.headline)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            //.foregroundStyle(.primary)
            .padding(10)
            
            HStack{
                
                RectanglePurple()
                RectangleGray()
                
            }
            .padding(10)
            RectangleBlack()
            
        }
    }
}

#Preview {
    PlansView()
}


struct RectanglePurple: View {
    var body: some View {
        ZStack{
            Rectangle().frame(maxWidth: 150,maxHeight: 170)
                .foregroundStyle(.purple)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack{
                VStack{
                    Text("Basic")
                    Text("$9")
                }
                .font(.title)
                
                .fontWeight(.bold)
                .fontDesign(.rounded)
                
                Text("per month")
                
                
            }
            .foregroundStyle(.white)
        }
    }
}




struct RectangleGray: View {
    var body: some View {
        ZStack{
            Rectangle().frame(maxWidth: 150,maxHeight: 170)
                .foregroundStyle(.gray)
                .opacity(0.4)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack{
                VStack{
                    Text("Pro")
                        .font(.title)
                        
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("$19")
                        .font(.title)
                        
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("per month")
                        .fontWeight(.bold)
                }
                
                
                
                    .padding(.all)
                
                ZStack {
                    Rectangle().frame(maxWidth: 110,maxHeight: 30)
                        .foregroundStyle(.orange)
                   
                    Text("Best for designer")
                        .font(.caption2)
                        .foregroundStyle(.white)
                        
                } .padding(.bottom,-90)
                
            }
            
        }
    }
}

struct RectangleBlack: View {
    var body: some View {
        ZStack{
            Rectangle().frame(maxWidth: 310,maxHeight: 180)
                .foregroundStyle(.black)
                .opacity(0.7)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack{
                VStack{
                    Image(systemName: "wand.and.rays")
                        .resizable()
                        .frame(maxWidth: 30, maxHeight:30)
                    Text("Team")
                        .font(.title)
                        
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("$299")
                        .font(.title)
                        
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("per month")
                }
                
                
                
                    .padding(.all)
                
                ZStack {
                    Rectangle().frame(maxWidth: 210,maxHeight: 30)
                        .foregroundStyle(.orange)
                   
                    Text("Perfect for teams with 20 member")
                        .font(.caption2)
                        
                        
                } .padding(.bottom,-10)
                
            }.foregroundStyle(.white)
            
        }
    }
}


/*
 Rectangle().frame(maxWidth: 310,maxHeight: 200)
     .foregroundStyle(.black)
     .opacity(0.7)
     .clipShape(.rect(cornerRadius: 10))
 */
