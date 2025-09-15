//
//  AuthenticationView.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    @Binding var showAuthenticationView: Bool
    @State var viewModel: AuthenticationViewModel
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
         
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                   singInWithGoogle()
                }
                
                Button {
                    singInAnonymously()
                } label: {
                    Text("Sing In anonymously")
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
    
    private func singInAnonymously() {
        Task {
            let _ = try await viewModel.singInAnonymous()
            showAuthenticationView = false
        }
    }
    
    private func singInWithGoogle() {
        Task {
               let _ = try await viewModel.signInWithGoogle()
                showAuthenticationView = false
            }
        }
    }
