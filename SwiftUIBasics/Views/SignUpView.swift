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
    @Published var isValidEmail: Bool = false
    @Published var isValidPassword: Bool = false
    @Published var isValidPasswordMatch: Bool = false
    @Published var isValid: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []

    init() {
        $email
            .receive(on: RunLoop.main)
            .map { email in
                let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
                return email.range(of: emailRegex, options: .regularExpression) != nil
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancelableSet)


        $password
            .receive(on: RunLoop.main)
            .map { password in
                return self.isValidPassword(password)
            }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm
            }
            .assign(to: \.isValidPasswordMatch, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest3($isValidEmail, $isValidPassword, $isValidPasswordMatch)
            .map { (isValidEmail, isValidPassword, isValidPasswordMatch) in
                return isValidEmail && isValidPassword && isValidPasswordMatch
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancelableSet)
    }

    private func isValidPassword(_ password: String) -> Bool {
        let pattern = "[A-Z]"
        let upperCase = ".*[A-Z]+.*"
        let lowerCase = ".*[a-z]+.*"
        let symbol = ".*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?]+.*"
        let number = ".*[0-9]+.*"

        if let _ = password.range(of: pattern, options: .regularExpression) {
            return password.count >= 8 &&
                   password.range(of: upperCase, options: .regularExpression) != nil &&
                   password.range(of: lowerCase, options: .regularExpression) != nil &&
                   password.range(of: symbol, options: .regularExpression) != nil &&
                   password.range(of: number, options: .regularExpression) != nil
        } else {
            return false
        }
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
            FormTextField(name: "Email", value: $vm.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            RequirementText(text: "Enter a valid email", isValid: vm.isValidEmail)
                .padding()
            FormTextField(name: "Password", value: $vm.password, isSecure: true)
            VStack {
                RequirementText(text: "A minimum of 8 characters and includes uppercase, lowercase, symbols, and numbers", isValid: vm.isValidPassword)
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
