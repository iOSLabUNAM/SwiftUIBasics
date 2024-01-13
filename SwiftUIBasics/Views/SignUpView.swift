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
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""

    // outputs
    @Published var isValidUsernameLength: Bool = false
    @Published var isValidPasswordLength: Bool = false
    @Published var isValidPasswordUpperCase: Bool = false
    @Published var isValidPasswordLowerCase: Bool = false
    @Published var isValidPasswordNumberCase: Bool = false
    @Published var isValidPasswordSymbolCase: Bool = false
    @Published var isValidPasswordMatch: Bool = false
    @Published var isValid: Bool = false
    @Published var isValidPre: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []
    
    func isValidEmailFormat(email: String) -> Bool {
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
            return emailPredicate.evaluate(with: email)
    }

    init() {
        $username
            .receive(on: RunLoop.main)
            .map { username in
                return self.isValidEmailFormat(email: username)
            }
            .assign(to: \.isValidUsernameLength, on: self)
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
            .map {
                password in
                let pattern = "[0-9]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidPasswordNumberCase, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map {
                password in
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
            .map {
                password in
                let pattern = "[^\\sA-Za-z0-9]+"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isValidPasswordSymbolCase, on: self)
            .store(in: &cancelableSet)
        

        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm
            }
            .assign(to: \.isValidPasswordMatch, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest4($isValidUsernameLength, $isValidPasswordLength, $isValidPasswordUpperCase, $isValidPasswordMatch)
            .map { (a, b, c, d) in
                return a && b && c && d
            }
            .assign(to: \.isValidPre, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest4($isValidPasswordLowerCase, $isValidPasswordSymbolCase, $isValidPasswordNumberCase, $isValidPre)
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
                
            FormTextField(name: "Email", value: $vm.username)
            RequirementText(text: "It should have @", isValid: vm.isValidUsernameLength)
                .padding()
            FormTextField(name: "Password", value: $vm.password, isSecure: true)
            VStack {
                RequirementText(text: "A minimum of 8 characters", isValid: vm.isValidPasswordLength)
                RequirementText(text: "One uppercase letter", isValid: vm.isValidPasswordUpperCase)
                RequirementText(text: "At least one LowerCase", isValid: vm.isValidPasswordLowerCase)
                RequirementText(text: "At least one symbol", isValid: vm.isValidPasswordSymbolCase)
                RequirementText(text: "At least one number", isValid: vm.isValidPasswordNumberCase)
                
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
