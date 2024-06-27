//
//  User.swift
//  AuthSDK
//
//  Created by Ahmed Durrani on 27/06/2024.
//

import Foundation
public struct User: Codable {
    public let id: String
    public let email: String
    
    
    public init(id: String, email: String) {
        self.id = id
        self.email = email
    }
}

struct LoginRequest: Codable{
    let email:String
    let password: String
}

struct SignupRequest: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let user: User
    let token: String
}

struct SignUpResponse: Codable {
    let user: User
    let token: String
}
