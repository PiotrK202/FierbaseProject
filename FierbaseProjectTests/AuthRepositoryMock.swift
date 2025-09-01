//
//  AuthRepositoryMock.swift
//  FierbaseProjectTests
//
//  Created by piotr koscielny on 1/9/25.
//

import Foundation
import FirebaseAuth
@testable import FierbaseProject

struct AuthRepositoryMock: AuthProtocol {
    var shouldThrowError = false
    var testUser = AuthDataResultUserModel(uid: "123", email: "mock@test.com", photoURL: nil)
    
    func createUser(email: String, password: String) async throws -> AuthDataResultUserModel {
        if shouldThrowError {
            throw NSError(domain: "MockError", code: 1)
        }
        return testUser
    }

    func signInUser(email: String, password: String) async throws -> AuthDataResultUserModel {
        if shouldThrowError {
            throw NSError(domain: "MockError", code: 2)
        }
        return testUser
    }
}
