//
//  SingInWithEmail.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import SwiftUI

struct SingInWithEmailView: View {
    @State var viewModel: SingInWithEmailViewModel
    @Binding var showAuthenticationView: Bool
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
                creatUser()
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
        .navigationTitle("Sing In With Email")
    }
    
    private func creatUser() {
        Task {
            do {
                let _ = try await viewModel.creatUser()
                showAuthenticationView = false
                print("succes")
            } catch {
                print(error)
            }
        }
    }
}
