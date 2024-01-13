//
//  SignUpView.swift
//  SwiftUIBasics
//
//  Created by Tere Durán on 09/12/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    // Inputs
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
    // Outputs
    @Published var isValidEmail: Bool = false
    @Published var isValidPassword: Bool = false
    @Published var isValidPasswordLength: Bool = false
    @Published var isValidPasswordUpperCase: Bool = false
    @Published var isValidPasswordLowerCase: Bool = false
    @Published var isValidPasswordCase: Bool = false
    @Published var passwordContainsSymbol: Bool = false
    @Published var passwordContainsNumber: Bool = false
    @Published var isValidPasswordMatch: Bool = false
    @Published var isValid: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []

    init() {
        $email
            .receive(on: RunLoop.main)
            .map { email in
                let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailFormat = NSPredicate(format:"SELF MATCHES %@", pattern)
                return emailFormat.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
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
                let pattern = /\W+/
                let symbols = Regex(pattern)
                if password.contains(symbols) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.passwordContainsSymbol, on: self)
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
            .assign(to: \.passwordContainsNumber, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm
            }
            .assign(to: \.isValidPasswordMatch, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest4($isValidPasswordUpperCase, $isValidPasswordLowerCase, $passwordContainsSymbol, $passwordContainsNumber)
            .receive(on: RunLoop.main)
            .map { (uppercase, lowercase, symbol, number) in
                return uppercase && lowercase && symbol && number
            }
            .assign(to: \.isValidPasswordCase, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest4($isValidEmail, $isValidPasswordLength, $isValidPasswordCase, $isValidPasswordMatch)
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
            FormTextField(name: "Email", value: $vm.email, fieldType: .emailAddress)
            RequirementText(text: "A valid email format", isValid: vm.isValidEmail)
                .padding()
            FormTextField(name: "Password", value: $vm.password, isSecure: true)
            VStack {
                RequirementText(text: "A minimum of 8 characters", isValid: vm.isValidPasswordLength)
                RequirementText(text: "At least one uppercase letter", isValid: vm.isValidPasswordUpperCase)
                RequirementText(text: "At lest one lowercase letter", isValid: vm.isValidPasswordLowerCase)
                RequirementText(text: "At least one symbol", isValid: vm.passwordContainsSymbol)
                RequirementText(text: "At least one digit", isValid: vm.passwordContainsNumber)
            }
            .padding()
            FormTextField(name: "Confirm Password", value: $vm.passwordConfirm, isSecure: true)
            RequirementText(text: "Your confirm password should be the same as password", isValid: vm.isValidPasswordMatch)
                .padding()
                .padding(.bottom, 50)
            Button(action: {
                print("Doing")
            }) {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(vm.isValid ? .maryBlue :.turquoise)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .disabled(!vm.isValid)

            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button(action: {
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


