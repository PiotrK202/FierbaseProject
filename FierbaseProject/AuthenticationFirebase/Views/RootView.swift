//
//  RootView.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 8/9/25.
//

import SwiftUI
import FirebaseAuth

struct RootView: View {
    @State private var showAuthenticationView = false
    @State var viewModel: RootViewModel
    
    var body: some View {
        ZStack {
            NavigationStack {
                ProfileView(viewModel: ProfileViewModel(), showAuthenticationView: $showAuthenticationView)
            }
        }
        .onAppear {
            let authUser = try? viewModel.getAuthenticatedUser()
            self.showAuthenticationView = authUser == nil
        }
        .fullScreenCover(isPresented: $showAuthenticationView) {
            NavigationStack {
                AuthenticationView(showAuthenticationView: $showAuthenticationView)
            }
        }
    }
}
