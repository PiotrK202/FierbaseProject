//
//  AuthRepository.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore

protocol AuthProtocol {
    func createUser(email: String, password: String) async throws -> AuthDataResultUserModel
    func signInUser(email: String, password: String) async throws -> AuthDataResultUserModel
    func signInWithGoogle() async throws -> AuthDataResultUserModel

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
    
    func signInWithGoogle() async throws -> AuthDataResultUserModel {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw URLError(.badURL)
        }
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        guard let presentingVC = await UIKitHelper.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        let signInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC)
        func extractTokenString(from any: Any) -> String? {
            let mirror = Mirror(reflecting: any)
            if mirror.displayStyle == .optional {
                if let child = mirror.children.first {
                    return extractTokenString(from: child.value)
                }
                return nil
            }
            if let gidToken = any as? GIDToken {
                return gidToken.tokenString
            }
            if let s = any as? String {
                return s
            }
            for child in mirror.children {
                if child.label == "tokenString", let s = child.value as? String {
                    return s
                }
            }
            return nil
        }
        guard let idTokenString = extractTokenString(from: signInResult.user.idToken as Any),
              let accessTokenString = extractTokenString(from: signInResult.user.accessToken as Any) else {
            throw URLError(.badServerResponse)
        }
        let credential = GoogleAuthProvider.credential(withIDToken: idTokenString,accessToken: accessTokenString)
        let authResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultUserModel(user: authResult.user)
    }
}


