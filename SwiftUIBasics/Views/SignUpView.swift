//
//  SignUpView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var terms: Bool = true
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField(text: $email) {
                        Text("email")
                    }
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    SecureField(text: $password) {
                        Text("Password")
                    }
                    .autocorrectionDisabled()
                    SecureField(text: $passwordConfirmation) {
                        Text("Password Confirmation")
                    }
                    .autocorrectionDisabled()

                    Toggle("Accept Terms and conditions", isOn: $terms)
                }
                Button("Create Account") {
                    print("Create account")
                }
                .font(.system(size: 24))
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
