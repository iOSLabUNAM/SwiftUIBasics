//
//  TestSignUp.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 12/01/24.
//

import SwiftUI

struct UserFormTextField: View {
    
    
    
    
}



struct SignUpPasswordScreen: View {
    @StateObject private var authVM = AuthenticationViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .font(.title)
                        .bold()
                    Text("Password must have more than 8 characters, contain some special character, one digit, one uppercase letter")
                        .font(.caption)
                }
                Group {
                    UserFormTextField(text: $authVM.password, type: .password)
                    VStack(alignment: .leading) {
                        RequirementsPickerView(type: .eightChar, toggleState: $authVM.hasEightChar)
                        RequirementsPickerView(type: .spacialChar, toggleState: $authVM.hasSpacialChar)
                        RequirementsPickerView(type: .oneDigit, toggleState: $authVM.hasOneDigit)
                        RequirementsPickerView(type: .upperCaseChar, toggleState: $authVM.hasOneUpperCaseChar)
                    }
                    UserFormTextField(text: $authVM.confirmPassword, type: .repeatPassword)
                    RequirementsPickerView(type: .confirmation, toggleState: $authVM.confirmationMatch)
                }
            }
        }
    }
}

#Preview {
    SignUpPasswordScreen()
}
