//
//  ProfileViewModel.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 8/9/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

@Observable
final class ProfileViewModel {
    
    func singOut() throws {
        try Auth.auth().signOut()
    }
}
