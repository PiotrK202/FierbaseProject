//
//  SingInWithGoogleViewModel.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 8/9/25.
//

import Foundation
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@Observable
final class AuthenticationViewModel {
    private let repository: AuthRepository
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func signInWithGoogle() async throws -> AuthDataResultUserModel {
        return try await repository.signInWithGoogle()
    }
}
