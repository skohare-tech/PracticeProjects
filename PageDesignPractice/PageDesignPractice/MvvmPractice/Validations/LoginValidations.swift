//
//  LoginValidations.swift
//  PageDesignPractice
//
//  Created by Admin on 18/01/22.
//

import Foundation
struct LoginValidation {

    func Validate(loginRequest: LoginRequest) -> ValidationResult
    {
        if(loginRequest.email!.isEmpty)
        {
            return ValidationResult(success: false, error: "User email is empty")
        }

        if(loginRequest.password!.isEmpty)
        {
            return ValidationResult(success: false, error: "User password is empty")
        }

        return ValidationResult(success: true, error: nil)
    }

}
