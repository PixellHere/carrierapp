//
//  AuthResponse.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 19/02/2026.
//

import Foundation

struct AuthResponse: Decodable {
    let accessToken: String
    let tokenType: String
    let refreshToken: String
    let expiresIn: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
    }
}
