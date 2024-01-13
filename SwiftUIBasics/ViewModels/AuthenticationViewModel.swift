//
//  AuthenticationViewModel.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 12/01/24.
//

import Foundation
import Combine

final class AuthenticationViewModel: ObservableObject {
    // MARK: - Password input
    @Published var password = ""
    @Published var confirmPassword = ""
    
    // MARK: - Password requirements
    @Published var hasEightChar = false
    @Published var hasSpacialChar = false
    @Published var hasOneDigit = false
    @Published var hasOneUpperCaseChar = false
    @Published var confirmationMatch = false
    @Published var areAllFieldsValid = false
    
    init() {
           validateSignUpFields()
       }
       
       private func validateSignUpFields() {
           /// Check password has minimum 8 characters
           $password
               .map { password in
                   password.count >= 8
               }
               .assign(to: &$hasEightChar)
           /// Check password has minimum 1 special character
           $password
               .map { password in
                   password.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|:\"';<>,.?/~`")) != nil
               }
               .assign(to: &$hasSpacialChar)
           /// Check password has minimum 1 digit
           $password
               .map { password in
                   password.contains { $0.isNumber }
               }
               .assign(to: &$hasOneDigit)
           /// Check password has minimum 1 uppercase letter
           $password
               .map { password in
                   password.contains { $0.isUppercase }
               }
               .assign(to: &$hasOneUpperCaseChar)
           /// Check confirmation match password
           Publishers.CombineLatest($password, $confirmPassword)
               .map { [weak self] _, _ in
                   guard let self else { return false}
                   return self.password == self.confirmPassword
               }
               .assign(to: &$confirmationMatch)
           /// Check all fields match
           Publishers.CombineLatest($password, $confirmPassword)
               .map { [weak self] _, _ in
                   guard let self else { return false}
                   return self.hasEightChar && self.hasSpacialChar && self.hasOneDigit && self.hasOneUpperCaseChar && self.confirmationMatch
               }
               .assign(to: &$areAllFieldsValid)
       }
   }
