//
//  AppState.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

final class AppState: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    init() {
        checkLogin()
    }
    
    func checkLogin() {
        if let _ = TokenManager.shared.getAccessToken(),
           !TokenManager.shared.isTokenExpired() {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
    
    func logout() {
        TokenManager.shared.clear()
        isLoggedIn = false
    }
}
