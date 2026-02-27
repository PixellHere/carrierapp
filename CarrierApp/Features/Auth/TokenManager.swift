//
//  TokenManager.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation

final class TokenManager {
    
    static let shared = TokenManager()
    
    private init() {}
    
    private let accessTokenKey = "access_token"
    private let refreshTokenKey = "refresh_token"
    private let expiryKey = "token_expiry"
    
    func saveTokens(accessToken: String,
                    refreshToken: String,
                    expiresIn: Int) {
        
        let expiryDate = Date().addingTimeInterval(TimeInterval(expiresIn))
        
        UserDefaults.standard.set(accessToken, forKey: accessTokenKey)
        UserDefaults.standard.set(refreshToken, forKey: refreshTokenKey)
        UserDefaults.standard.set(expiryDate, forKey: expiryKey)
    }
    
    func getAccessToken() -> String? {
        UserDefaults.standard.string(forKey: accessTokenKey)
    }
    
    func getRefreshToken() -> String? {
        UserDefaults.standard.string(forKey: refreshTokenKey)
    }
    
    func isTokenExpired() -> Bool {
        guard let expiry = UserDefaults.standard.object(forKey: expiryKey) as? Date else {
            return true
        }
        return Date() >= expiry
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: accessTokenKey)
        UserDefaults.standard.removeObject(forKey: refreshTokenKey)
        UserDefaults.standard.removeObject(forKey: expiryKey)
    }
}
