//
//  StatsCardView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct StatsCardView: View {
    
    let icon: String
    let value: String
    let title: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) { // <-- wyrównanie do lewej
            
            // HStack z ikoną i liczbą
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.15))
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(color)
                }
                
                Text(value)
                    .font(.largeTitle.bold())
                    .foregroundColor(.primary)
                
                Spacer() // <-- przesuwa wszystko w lewo w HStack
            }
            
            // Tytuł pod HStack, wyrównany do lewej
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading) // <-- cały VStack wyrównany do lewej
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 2)
    }
}
