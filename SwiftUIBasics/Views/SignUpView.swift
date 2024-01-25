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

    @Published var isValidPasswordLength: Bool = false
    @Published var isValidPasswordLowerCase: Bool = false
    @Published var isValidPasswordUpperCase: Bool = false
    @Published var passwordHasSpecialSymbol: Bool = false
    @Published var passwordHasNumber: Bool = false
    @Published var isValidPassword: Bool = false

    @Published var isValidPasswordMatch: Bool = false

    @Published var isValid: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []

    init() {
        $email
            .receive(on: RunLoop.main)
            .map { email in
                let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
                return emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                let symbolRegex = Regex(/\W+/)
                return password.contains(symbolRegex) 
            }
            .assign(to: \.passwordHasSpecialSymbol, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                let numberRegex = Regex(/[0-9]/)
                return password.contains(numberRegex) 
            }
            .assign(to: \.passwordHasNumber, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                let lowercaseRegex = Regex(/[a-z]/)
                return password.contains(lowercaseRegex) 
            }
            .assign(to: \.isValidPasswordLowerCase, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                let uppercaseRegex = Regex(/[A-Z]/)
                return password.contains(uppercaseRegex) 
            }
            .assign(to: \.isValidPasswordUpperCase, on: self)
            .store(in: &cancelableSet)

         $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isValidPasswordLength, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest4($isValidPasswordLength, $isValidPasswordUpperCase, $isValidPasswordLowerCase, $passwordHasSpecialSymbol, $passwordHasNumber)
            .receive(on: RunLoop.main)
            .map { (length, uppercase, lowercase, symbol, number) in
                return length && uppercase && lowercase && symbol && number
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

        Publishers.CombineLatest4($isValidEmail, $isValidPassword, $isValidPasswordMatch)
            .map { (email, password, passwordMatch) in
                return email && password && passwordMatch
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
                RequirementText(text: "At least one symbol", isValid: vm.passwordHasSpecialSymbol)
                RequirementText(text: "At least one digit", isValid: vm.passwordHasNumber)
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
