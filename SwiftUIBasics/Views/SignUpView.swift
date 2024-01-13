//
//  SignUpView.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 09/12/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    // inputs
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""

    // outputs
    @Published var isValidUserEmail: Bool = false
    @Published var isValidPasswordLength: Bool = false
    @Published var isValidPasswordUpperCase: Bool = false
    @Published var isValidPasswordMatch: Bool = false
    @Published var isValid: Bool = false
    
    //Rules
    
    @Published var isValidPasswordLowerCase: Bool = false
    @Published var isValidPasswordSymbol: Bool = false
    @Published var isValidPasswordNumber: Bool = false
    @Published var isValidPasswordCharacter: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []

    init() {
        $email
            .receive(on: RunLoop.main)
            .map { email in
                let pattern = #"^\S+@\S+\.\S+$"#
                if let _ = email.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidUserEmail, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isValidPasswordLength, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidPasswordUpperCase, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[a-z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidPasswordLowerCase, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[0-9]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidPasswordNumber, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[!  # $ % & ' ( ) * + ,  -. / : ; < = > ? @ [ ] ^ _ ` { | }]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidPasswordSymbol, on: self)
            .store(in: &cancelableSet)
        
        

        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm
            }
            .assign(to: \.isValidPasswordMatch, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest4($isValidUserEmail, $isValidPasswordLength, $isValidPasswordUpperCase, $isValidPasswordMatch)
            .map { (a, b, c, d) in
                return a && b && c && d
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest4($isValidUserEmail, $isValidPasswordLowerCase, $isValidPasswordSymbol, $isValidPasswordNumber)
            .map { (a, b, c, d) in
                return a && b && c && d
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancelableSet)
    }
}

struct SignUpView: View {
    @ObservedObject var vm = SignUpViewModel()

    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundStyle(.maryBlue)
                .padding(.bottom, 30)
            FormTextField(name: "E–mail", value: $vm.email)
            RequirementText(text: "Email is valid", isValid: vm.isValidUserEmail)
                .padding()
            FormTextField(name: "Password", value: $vm.password, isSecure: true)
            VStack {
                RequirementText(text: "A minimum of 8 characters", isValid: vm.isValidPasswordLength)
                RequirementText(text: "One uppercase letter", isValid: vm.isValidPasswordUpperCase)
                RequirementText(text: "One lowercase letter", isValid: vm.isValidPasswordLowerCase)
                RequirementText(text: "One symbol", isValid: vm.isValidPasswordSymbol)
                RequirementText(text: "One number", isValid: vm.isValidPasswordNumber)
            }
            .padding()
            FormTextField(name: "Confirm Password", value: $vm.passwordConfirm, isSecure: true)
            RequirementText(text: "Your confirm password should be the same as password", isValid: vm.isValidPasswordMatch)
                .padding()
                .padding(.bottom, 50)
            Button(action: {
                print("Doing")
                // Proceed to the next screen
            }) {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(vm.isValid ? .maryBlue :.turquoise)
                    // .background(LinearGradient(gradient: Gradient(colors: [.turquoise, .maryBlue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .disabled(!vm.isValid)

            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button(action: {
                    // Proceed to Sign in screen
                }) {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(.maryBlue)
                }
            }.padding(.top, 50)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}
