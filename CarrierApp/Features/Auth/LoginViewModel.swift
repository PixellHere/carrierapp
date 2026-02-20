//
//  LoginViewModel.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 19/02/2026.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var isLoggedIn = false
    
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    func login() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await authService.login(
                username: username,
                password: password
            )
            
            print("Access token:", response.accessToken)
            isLoggedIn = true
            
        } catch {
            errorMessage = "Nieprawidłowe dane logowania"
        }
        
        isLoading = false
    }
}
