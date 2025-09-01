//
//  LoginWithEmailViewModel.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

@Observable
final class LoginWithEmailViewModel {
    private let repository: AuthProtocol
    var email = ""
    var password = ""
   
    init(repository: AuthProtocol) {
        self.repository = repository
    }
    
    func loginUser() async throws -> AuthDataResultUserModel {
        try await repository.signInUser(email: email, password: password)
    }
}
