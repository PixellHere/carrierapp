//
//  LoginView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 19/02/2026.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel = LoginViewModel(authService: AuthService())
    @State private var showPassword = false
    @State private var showSuccessAlert = false
    
    var body: some View {
        ZStack {
            
            // Background
            Color(.systemBackground)
                .ignoresSafeArea()
            
            // Decorative blobs
            VStack {
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color.blue.opacity(0.08))
                        .frame(width: 250, height: 250)
                        .blur(radius: 60)
                }
                Spacer()
                HStack {
                    Circle()
                        .fill(Color.blue.opacity(0.08))
                        .frame(width: 250, height: 250)
                        .blur(radius: 60)
                    Spacer()
                }
            }
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    
                    // Logo
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.1))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "shippingbox.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 40)
                    
                    // Header
                    VStack(spacing: 8) {
                        Text("Welcome back")
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("Sign in to manage your shipments")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Form
                    VStack(spacing: 20) {
                        
                        // Username
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Email")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(.gray)
                                
                                TextField("johndoe@email.com", text: $viewModel.username)
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.emailAddress)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                        }
                        
                        // Password
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Password")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.gray)
                                
                                if showPassword {
                                    TextField("••••••••", text: $viewModel.password)
                                } else {
                                    SecureField("••••••••", text: $viewModel.password)
                                }
                                
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                            
                            HStack {
                                Spacer()
                                Button("Forgot password?") {
                                    print("Forgot password tapped")
                                }
                                .font(.caption)
                                .foregroundColor(.blue)
                            }
                        }
                        
                        // Login Button
                        Button {
                            Task {
                                await viewModel.login()
                                
                                if viewModel.isLoggedIn {
                                    appState.isLoggedIn = true
                                }
                            }
                        } label: {
                            if viewModel.isLoading {
                                ProgressView()
                                    .tint(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            } else {
                                Text("Sign In")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            }
                        }
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .shadow(color: Color.blue.opacity(0.3), radius: 10, y: 6)
                        .padding(.top, 8)
                    }
                    
                    // Divider
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.3))
                        
                        Text("or continue with")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.3))
                    }
                    .padding(.vertical, 8)
                    
                    // Social Buttons
                    HStack(spacing: 16) {
                        
                        Button {
                            print("Google login")
                        } label: {
                            HStack {
                                Image(systemName: "globe")
                                Text("Google")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                        }
                        
                        Button {
                            print("Apple login")
                        } label: {
                            HStack {
                                Image(systemName: "applelogo")
                                Text("Apple")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                        }
                    }
                    
                    // Footer
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.secondary)
                        
                        Button("Sign up") {
                            print("Register tapped")
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    }
                    .font(.footnote)
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
