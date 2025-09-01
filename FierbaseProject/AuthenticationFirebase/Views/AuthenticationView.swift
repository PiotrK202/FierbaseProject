//
//  AuthenticationView.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SingInWithEmailView(viewModel: SingInWithEmailViewModel(repository: AuthRepository()))
                } label: {
                    Text("Sing In with email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                NavigationLink {
                    LoginWithEmailView(viewModel: LoginWithEmailViewModel(repository: AuthRepository()))
                } label: {
                    Text("Login with email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
            }
            .navigationTitle("Sing In")
        }
    }
}

#Preview {
    AuthenticationView()
}
