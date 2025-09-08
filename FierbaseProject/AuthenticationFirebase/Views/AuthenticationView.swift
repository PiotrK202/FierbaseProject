//
//  AuthenticationView.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var showAuthenticationView: Bool
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SingInWithEmailView(viewModel: SingInWithEmailViewModel(repository: AuthRepository()), showAuthenticationView: $showAuthenticationView)
                } label: {
                    Text("Sing In with email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                }
                NavigationLink {
                    LoginWithEmailView(viewModel: LoginWithEmailViewModel(repository: AuthRepository()), showAuthenticationView: $showAuthenticationView)
                } label: {
                    Text("Login with email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                }
                Spacer()
            }
            .navigationTitle("Sing In")
        }
    }
}
