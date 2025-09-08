//
//  ProfileView.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 8/9/25.
//

import SwiftUI

struct ProfileView: View {
    @State var viewModel: ProfileViewModel
    @Binding var showAuthenticationView: Bool
    var body: some View {
        VStack {
            Text("Profile")
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem {
                Button {
                    Task {
                        do {
                            try viewModel.singOut()
                            showAuthenticationView = true
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Sing Out")
                }
            }
        }
    }
}
