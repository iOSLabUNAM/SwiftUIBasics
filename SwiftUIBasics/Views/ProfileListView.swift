//
//  ProfileListView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct Profile: Codable, Identifiable {
    var id = UUID()
    let name: String
    let bio: String
}

struct ProfileCellView: View {
    let profile: Profile
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(.headline)
                Text(profile.bio)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "info.circle")
                .foregroundStyle(.indigo)
        }.padding()
    }
}

struct ProfileListView: View {
    let profiles: [Profile]
    var body: some View {
        NavigationView{
            List(profiles) { profile in
                NavigationLink {
                    Text(profile.name)
                } label: {
                    ProfileCellView(profile: profile)
                }
            }
            .navigationTitle("Followers")
        }
    }
}

#Preview {
    ProfileListView(profiles: [
        Profile(name: "Joe Doe", bio: "Amateur photographer"),
        Profile(name: "Jane Doe", bio: "Real state agent"),
        Profile(name: "Jim Morrison", bio: "Musician")
    ])
}
