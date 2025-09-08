//
//  RooTViewModel.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 8/9/25.
//

import SwiftUI
import Foundation
import FirebaseAuth

@Observable
final class RootViewModel {
    
    func getAuthenticatedUser() throws -> AuthDataResultUserModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultUserModel(user: user)
    }
}
