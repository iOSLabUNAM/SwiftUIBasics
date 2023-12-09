//
//  PlansView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct Plan {
    var name: String
    var price: String
    var description: String
    var isMagic: Bool = false
    var customLabel: String = ""
    var fontColor: Color = .white
    var backgroundColor: Color
}

struct PlanView: View {
    var plan: Plan
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            VStack {
                if plan.isMagic {
                    Image(systemName: "wand.and.stars")
                        .font(.largeTitle)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                Text(plan.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Text(plan.price)
                    .font(.title)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Text(plan.description)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
            }
            .frame(
                minWidth: 0,
                idealWidth: 100,
                maxWidth: .infinity,
                minHeight: 165
            )
            .background(plan.backgroundColor)
            .cornerRadius(15)
            .padding()
            .shadow(radius: 10)
            
            if !plan.customLabel.isEmpty {
                Text(plan.customLabel)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(5)
                    .background(.yellow)
                    .offset(x: 0, y: 80)
            }
        }
    }
}


struct PlansView: View {
    var body: some View {
        VStack {
            Text("Choose Your Plan")
                .font(.system(size: 47))
                .fontWeight(.heavy)
                .fontDesign(.rounded)
            
            HStack(spacing: 0) {
                PlanView(plan: Plan(
                    name: "Basic",
                    price: "$9",
                    description: "Per Month",
                    backgroundColor: .blue
                ))
                
                PlanView(plan: Plan(
                    name: "Pro",
                    price: "$19",
                    description: "Per Month",
                    customLabel: "Best for Designers",
                    backgroundColor: .green
                ))
            }
            .frame( maxHeight: 165)
            
            PlanView(plan: Plan(
                name: "Premium",
                price: "$299",
                description: "Per Month",
                isMagic: true,
                customLabel: "Perfect for teams with 20 members",
                backgroundColor: .purple
            ))
        }
    }
}

#Preview {
    PlansView()
}
