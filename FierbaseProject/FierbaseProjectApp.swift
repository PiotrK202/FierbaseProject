//
//  FierbaseProjectApp.swift
//  FierbaseProject
//
//  Created by piotr koscielny on 1/9/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct FierbaseProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
