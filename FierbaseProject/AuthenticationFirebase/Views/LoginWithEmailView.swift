//
//  LoginWithEmailView.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import SwiftUI

struct LoginWithEmailView: View {
    @State var viewModel: LoginWithEmailViewModel
    var body: some View {
        VStack {
            TextField("Email",text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            SecureField("Password",text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            
            Button {
                loginUser()
            } label: {
                Text("Sing In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            
        }
        .padding()
        .navigationTitle("Login With Email")
    }
    
    private func loginUser() {
        Task {
            do {
                let _ = try await viewModel.loginUser()
                print("succes")
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    LoginWithEmailView(viewModel: LoginWithEmailViewModel(repository: AuthRepository()))
}
