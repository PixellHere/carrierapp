//
//  AuthServiceProtocol.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 20/02/2026.
//

import Foundation

protocol AuthServiceProtocol {
    func login(username: String, password: String) async throws -> AuthResponse
}
