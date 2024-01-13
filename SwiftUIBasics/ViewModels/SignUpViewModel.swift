//
//  SignUpViewModel.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 12/01/24.
//

import Foundation
import Combine


final class SignUpViewModel: ObservableObject {
    
  // Input values from view
  @Published var userName = ""
  @Published var userEmail = ""
  @Published var userPassword = ""
  @Published var userRepeatedPassword = ""
    
    // Output subscribers
     @Published var formIsValid = false
     
     private var publishers = Set<AnyCancellable>()
     
     init() {
       isSignupFormValidPublisher
         .receive(on: RunLoop.main)
         .assign(to: \.formIsValid, on: self)
         .store(in: &publishers)
     }

}

private extension SignUpViewModel {
    
    var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .map { name in
                return name.count >= 3
            }
            .eraseToAnyPublisher()
    }
    
    var isUserEmailValidPublisher: AnyPublisher<Bool, Never> {
          $userPassword
              .map { password in
                  return password.count >= 8
              }
              .eraseToAnyPublisher()
      }
    
    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
          $userPassword
              .map { password in
                  return password.count >= 8
              }
              .eraseToAnyPublisher()
      }
    
    var passwordMatchesPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($userPassword, $userRepeatedPassword)
            .map { password, repeated in
                return password == repeated
            }
            .eraseToAnyPublisher()
    }
    
    var isSignupFormValidPublisher: AnyPublisher<Bool, Never> {
          Publishers.CombineLatest4(
              isUserNameValidPublisher,
              isUserEmailValidPublisher,
              isPasswordValidPublisher,
              passwordMatchesPublisher)
              .map { isNameValid, isEmailValid, isPasswordValid, passwordMatches in
                  return isNameValid && isEmailValid && isPasswordValid && passwordMatches
              }
              .eraseToAnyPublisher()
      }
    
}
