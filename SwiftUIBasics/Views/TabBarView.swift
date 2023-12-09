//
//  TabBarView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListView().tag(0).badge(3).tabItem {
                Image(systemName: "list.dash")
                Text("List")
            }
            SettingsView().tag(1).tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }.navigationTitle("List")
        }
    }
}


struct SettingsView: View {
    @State var vibrateOnRing: Bool = false
    var body: some View {
        NavigationView {
            Form {
                Section("General") {
                    Toggle(
                        "Vibrate on Ring",
                        systemImage: "dot.radiowaves.left.and.right",
                        isOn: $vibrateOnRing
                    )
                    Text("lorem ispum")
                }
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    TabBarView()
}
