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
    @Published var isValidPasswordLength = false
    @Published var isValidPasswordUppercase = false
    @Published var isValidPasswordLowercase = false
    @Published var isValidPasswordSymbols = false
    @Published var isValidPasswordDigits = false
    @Published var isValidPasswordMatch: Bool = false
    @Published var isValid: Bool = false

    private var cancelableSet: Set<AnyCancellable> = []

    init() {
        $email
            .receive(on: RunLoop.main)
            .map { email in
                let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
                return emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map {
                $0.isValidLength()
            }
            .assign(to: \.isValidPasswordLength, on: self)
            .store(in: &cancelableSet)

        $password
            .receive(on: RunLoop.main)
            .map {
                $0.containsUppercase()
            }
            .assign(to: \.isValidPasswordUppercase, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map {
                $0.containsLowercase()
            }
            .assign(to: \.isValidPasswordLowercase, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map {
                $0.containsSymbol()
            }
            .assign(to: \.isValidPasswordSymbols, on: self)
            .store(in: &cancelableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map {
                $0.containsNumber()
            }
            .assign(to: \.isValidPasswordDigits, on: self)
            .store(in: &cancelableSet)

        Publishers.CombineLatest4($isValidPasswordLength,$isValidPasswordUppercase, $isValidPasswordLowercase, $isValidPasswordSymbols)
            .receive(on: RunLoop.main)
            .map {
                $0 && $1 && $2 && $3
            }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancelableSet)
        
        Publishers.CombineLatest($isValidPasswordDigits, $isValidPassword)
            .receive(on: RunLoop.main)
            .map { $0 && $1 }
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
            .map { (a, b, c) in
                return a && b && c
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
            FormTextField(name: "Email", value: $vm.email)
                .keyboardType(.emailAddress)
            RequirementText(text: "Valid email format", isValid: vm.isValidEmail)
                .padding()

            FormTextField(name: "Password", value: $vm.password, isSecure: true)
            VStack {
                RequirementText(text: "At least 8 characters", isValid: vm.isValidPasswordLength)
                RequirementText(text: "At least one uppercase letter", isValid: vm.password.containsUppercase())
                RequirementText(text: "At least one lowercase letter", isValid: vm.password.containsLowercase())
                RequirementText(text: "At least one symbol", isValid: vm.password.containsSymbol())
                RequirementText(text: "At least one number", isValid: vm.password.containsNumber())
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

extension String {
    func isValidLength() -> Bool {
        return self.count >= 8
    }

    func containsUppercase() -> Bool {
        return self.rangeOfCharacter(from: .uppercaseLetters) != nil
    }

    func containsLowercase() -> Bool {
        return self.rangeOfCharacter(from: .lowercaseLetters) != nil
    }

    func containsSymbol() -> Bool {
        let symbolCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|;:'\",.<>/?`~")
        return self.rangeOfCharacter(from: symbolCharacterSet) != nil
    }

    func containsNumber() -> Bool {
        return self.rangeOfCharacter(from: .decimalDigits) != nil
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
