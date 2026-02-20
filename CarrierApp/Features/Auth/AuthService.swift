//
//  AuthService.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 20/02/2026.
//

import Foundation

import Foundation

final class AuthService: AuthServiceProtocol {
    
    func login(username: String, password: String) async throws -> AuthResponse {
        
        guard let url = URL(string: "https://mwl.meest.com/mwl/v2/api/auth") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = [
            "username": username,
            "password": password
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let decoded = try JSONDecoder().decode(AuthResponse.self, from: data)
        return decoded
    }
}
