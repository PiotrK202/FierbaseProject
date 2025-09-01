//
//  SingInWithEmailViewModel.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

@Observable
final class SingInWithEmailViewModel {
    private let repository: AuthProtocol
    var email = ""
    var password = ""
   
    init(repository: AuthProtocol) {
        self.repository = repository
    }
    
    func creatUser() async throws -> AuthDataResultUserModel {
        try await repository.createUser(email: email, password: password)
    }
}
