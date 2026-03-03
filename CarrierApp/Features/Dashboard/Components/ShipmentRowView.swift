//
//  ShipmentRowView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct ShipmentRowView: View {
    
    let shipment: Shipment
    
    var body: some View {
        HStack(spacing: 16) {
            
            Image(systemName: shipment.status.icon)
                .foregroundColor(shipment.status.color)
                .padding()
                .background(shipment.status.color.opacity(0.15))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(shipment.number)
                    .font(.headline)
                
                Text("\(shipment.recipientInfo.firstName) \(shipment.recipientInfo.lastName)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(shipment.status.title)
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(shipment.status.color.opacity(0.15))
                    .foregroundColor(shipment.status.color)
                    .clipShape(Capsule())
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.03), radius: 4)
    }
}
