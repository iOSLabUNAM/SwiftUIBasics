//
//  SymbolsAnimations.swift
//  SwiftUIBasics
//
//  Created by Luis Ezcurdia on 09/12/23.
//

import SwiftUI

struct SymbolsAnimations: View {
    @State private var animate = false

    var body: some View {
        VStack {
            Image(systemName: animate ? "checkmark.circle" : "faceid")
                .font(.system(size: 100))
                .symbolRenderingMode(.palette)
                .symbolEffect(.bounce, value: animate)
                .contentTransition(.symbolEffect(.replace))
                .foregroundStyle(Color.indigo, Color.cyan)
                .onTapGesture {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    animate.toggle()
                }
        }
    }
}

#Preview {
    SymbolsAnimations()
}
