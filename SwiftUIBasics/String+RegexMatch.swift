//
//  String+RegexMatch.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 12/01/24.
//

import Foundation

extension String {
    func regexMatch(pattern: String) -> Bool {
        if let _ = self.range(of: pattern, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
}
