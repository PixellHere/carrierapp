//
//  DashboardHeaderView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct DashboardHeaderView: View {
    
    let userName: String
    
    var body: some View {
        HStack(spacing: 12) {
            
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 48, height: 48)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.blue)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Good morning,")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("Welcome, \(userName)")
                    .font(.headline.bold())
            }
            
            Spacer()
            
            ZStack(alignment: .topTrailing) {
                Button {
                    print("Notifications tapped")
                } label: {
                    Image(systemName: "bell")
                        .font(.title3)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .offset(x: -6, y: 6)
            }
        }
    }
}
