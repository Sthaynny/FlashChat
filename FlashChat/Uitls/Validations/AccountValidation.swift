//
//  AccountValidation.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 14/02/25.
//

import Foundation


struct AccountValidation{
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
