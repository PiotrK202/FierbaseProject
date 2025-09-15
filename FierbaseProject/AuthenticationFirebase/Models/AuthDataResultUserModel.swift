//
//  AuthDataResultUserModel.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import Foundation
import FirebaseAuth

struct AuthDataResultUserModel {
    let uid: String
    let email: String?
    let photoURL: String?
    let isAnonymous: Bool?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
        self.isAnonymous = user.isAnonymous
    }
    
    init(uid: String, email: String, photoURL: String?, isAnonymous: Bool = false) {
        self.uid = uid
        self.email = email
        self.photoURL = photoURL
        self.isAnonymous = isAnonymous
    }
}
