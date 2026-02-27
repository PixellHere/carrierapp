//
//  CarrierAppApp.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 19/02/2026.
//

import SwiftUI

@main
struct CarrierAppApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if appState.isLoggedIn {
                    MainTabView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(appState)
        }
    }
}
