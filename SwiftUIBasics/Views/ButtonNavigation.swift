//
//  ButtonNavigation.swift
//  SwiftUIBasics
//
//  Created by Luis Ezcurdia on 16/12/23.
//

import SwiftUI

struct ButtonNavigation: View {
    @State var isPresenting = false
    var body: some View {
//        NavigationView {
//            NavigationLink {
//                Color.indigo
//            } label: {
//                Button("Open", systemImage: "bolt") {
//                    print("hello")
//                }.buttonStyle(.borderedProminent)
//            }
//        }
        NavigationStack {
            Button("Open", systemImage: "bolt") {
                isPresenting = true
            }
            .buttonStyle(.borderedProminent)
            .navigationDestination(isPresented: $isPresenting) {
                Color.indigo
            }
        }
    }
}

#Preview {
    ButtonNavigation()
}
