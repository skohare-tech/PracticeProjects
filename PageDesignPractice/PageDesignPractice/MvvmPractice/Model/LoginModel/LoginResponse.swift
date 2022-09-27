//
//  LoginResponse.swift
//  PageDesignPractice
//
//  Created by Admin on 18/01/22.
//

import Foundation
//struct LoginResponse : Decodable {
//
//    let errorMessage: String?
//    let data: LoginResponseData?
//}
//
//struct LoginResponseData : Decodable
//{
//    let userName: String
//    let userID: Int
//    let email: String
//
//    enum CodingKeys: String, CodingKey {
//        case userName
//        case userID = "userId"
//        case email
//    }
//}


// MARK: - EmployeeModel
struct LoginResponse: Codable {
    let id: String
      let code: Int
      let message: String
      let data: LoginResponseData?

      enum CodingKeys: String, CodingKey {
          case id = "$id"
          case code, message, data
      }
}

// MARK: - DataClass
struct LoginResponseData: Codable {
    let id: String
    let dataID: Int
    let name, email, token: String

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case dataID = "Id"
        case name = "Name"
        case email = "Email"
        case token = "Token"
    }
}
