//
//  AuthRepository.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import Foundation
import FirebaseAuth

protocol AuthProtocol {
    func createUser(email: String, password: String) async throws -> AuthDataResultUserModel
    func signInUser(email: String, password: String) async throws -> AuthDataResultUserModel
}

final class AuthRepository: AuthProtocol {
    func createUser(email: String, password: String) async throws -> AuthDataResultUserModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultUserModel(user: authDataResult.user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataResultUserModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultUserModel(user: authDataResult.user)
    }
}

