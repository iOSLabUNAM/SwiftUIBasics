//
//  FormTextField.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//


import SwiftUI

struct FormTextField: View {
    var name = ""
    @Binding var value: String
    var isSecure = false
    var fieldType: UIKeyboardType = .default

    var body: some View {
        VStack {
            if isSecure {
                SecureField(name, text: $value)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(name, text: $value)
                    .keyboardType(fieldType)
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
        FormTextField(name: "Email", value: .constant(""), isSecure: false, fieldType: .emailAddress)
        FormTextField(name: "Password", value: .constant(""), isSecure: true)
    }
}
