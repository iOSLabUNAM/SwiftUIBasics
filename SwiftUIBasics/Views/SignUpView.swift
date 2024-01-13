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
    @Published var isValidPasswordUpperCase: Bool = false
    @Published var isValidPasswordLowerCase: Bool = false
    @Published var isValidPasswordUpperLowerCase: Bool = false
    @Published var isValidPasswordSymbol: Bool = false
    @Published var isValidPasswordNumber: Bool = false
    @Published var isValidPasswordSymbolNumber: Bool = false
    @Published var isValidPassword: Bool = false
    @Published var isPasswordMatch: Bool = false
    @Published var isValid: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []

    init() {
        $email
            .receive(on: RunLoop.main)
            .map { $0.regexMatch(pattern: "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$") }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { $0.count >= 8 }
            .assign(to: \.isValidPasswordLength, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { $0.regexMatch(pattern: "[A-Z]") }
            .assign(to: \.isValidPasswordUpperCase, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { $0.regexMatch(pattern: "[a-z]") }
            .assign(to: \.isValidPasswordLowerCase, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { $0.regexMatch(pattern: "\\W") }
            .assign(to: \.isValidPasswordSymbol, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map { $0.regexMatch(pattern: "[0-9]") }
            .assign(to: \.isValidPasswordNumber, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest($isValidPasswordUpperCase, $isValidPasswordLowerCase)
            .map { $0 && $1 }
            .assign(to: \.isValidPasswordUpperLowerCase, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest($isValidPasswordSymbol, $isValidPasswordNumber)
            .map { $0 && $1 }
            .assign(to: \.isValidPasswordSymbolNumber, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest3($isValidPasswordLength, $isValidPasswordUpperLowerCase, $isValidPasswordSymbolNumber)
            .map { $0 && $1 && $2 }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { !$0.isEmpty && !$1.isEmpty && $0 == $1 }
            .assign(to: \.isPasswordMatch, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest3($isValidEmail, $isValidPassword, $isPasswordMatch)
            .map { $0 && $1 && $2 }
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
            FormTextField(name: "Email", value: $vm.email, type: .email)
            RequirementText(text: "Valid email format", isValid: vm.isValidEmail)
                .padding()
            FormTextField(name: "Password", value: $vm.password, type: .password)
            VStack {
                RequirementText(text: "A minimum of 8 characters", isValid: vm.isValidPasswordLength)
                RequirementText(text: "At least one uppercase letter", isValid: vm.isValidPasswordUpperCase)
                RequirementText(text: "At least one lowercase letter", isValid: vm.isValidPasswordLowerCase)
                RequirementText(text: "At least one symbol", isValid: vm.isValidPasswordSymbol)
                RequirementText(text: "At least one number", isValid: vm.isValidPasswordNumber)
            }
            .padding()
            FormTextField(name: "Confirm Password", value: $vm.passwordConfirm, type: .password)
            RequirementText(text: "Your confirm password should be the same as password", isValid: vm.isPasswordMatch)
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
