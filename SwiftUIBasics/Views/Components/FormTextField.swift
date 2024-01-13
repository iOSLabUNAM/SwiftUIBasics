//
//  FormTextField.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct FormTextField: View {
    enum InputType {
        case text
        case email
        case password
    }
    var name = ""
    @Binding var value: String
    var type: InputType = .text

    var body: some View {
        VStack {
            switch type {
            case .email:
                TextField(name, text: $value)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            case .password:
                SecureField(name, text: $value)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            default:
                TextField(name, text: $value)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color.lightGrey)
                .padding(.horizontal)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        FormTextField(name: "Username", value: .constant(""))
        FormTextField(name: "Email", value: .constant(""), type: .email)
        FormTextField(name: "Password", value: .constant(""), type: .password)
    }
}
