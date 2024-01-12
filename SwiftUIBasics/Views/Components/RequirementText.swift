//
//  RequirementText.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct RequirementText: View {
    var text: String
    var isValid: Bool = false
    var validIcon = "checkmark.circle.fill"
    var invalidIcon = "xmark.square"

    var body: some View {
        HStack {
            if isValid {
                Image(systemName: validIcon)
                    .foregroundColor(.greenTurquoise)
            } else {
                Image(systemName: invalidIcon)
                    .foregroundColor(.coral)
            }
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        RequirementText(text: "Must contain an upper case letter", isValid: false)
        RequirementText(text: "Must contain an number", isValid: true)
    }
}
