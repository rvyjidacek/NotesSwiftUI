//
//  StringValidator.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 14.04.2023.
//

import Foundation

final class StringValidator {
    
    enum ValidationRule {
        
        case url
        
        var regex: String {
            switch self {
            
            case .url:
                return "/^https?:\\/\\/(?:www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b(?:[-a-zA-Z0-9()@:%_\\+.~#?&\\/=]*)$/"
            }
        }
    }
    
    static func isValid(string: String?, for rule: ValidationRule) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", rule.regex)
        return test.evaluate(with: string)
    }
}
