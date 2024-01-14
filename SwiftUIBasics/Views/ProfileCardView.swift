//
//  ProfileCardView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 08/12/23.
//

import SwiftUI

struct ProfileCardView: View {
    var vm: ProfileCardVM

    var body: some View {
        HStack {
            CircularImage(imageName: vm.image)
            VStack(alignment: .leading) {
                Text(vm.name)
                    .font(.headline)
                    .fontDesign(.rounded)
                    .foregroundStyle(.primary)
                Text(vm.bio)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                HStack {
                    Button("Follow") {
                        vm.followers += 1
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                    Text("\(vm.followers) followers")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                        .padding(.top, 5)
                }
            }
        }
    }
}

#Preview {
    ProfileCardView(vm: ProfileCardVM(image: "yo", name: "Paula Flores", bio: "Ingeniería en robar tu corazón ", followers: 87))
}
