//
//  ShipmentRowView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct ShipmentRowDetailedView: View {
    
    let shipment: Shipment
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 16) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(shipment.number)
                        .font(.subheadline.bold())
                        .foregroundColor(.blue)
                    
                    Text("\(shipment.recipientInfo.firstName) \(shipment.recipientInfo.lastName)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 6) {
                    
                    statusBadge
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            Rectangle()
                .fill(Color.blue.opacity(0.15))
                .frame(height: 1)
        }
        .background(Color.white)
    }
    
    private var statusBadge: some View {
        HStack(spacing: 6) {
            Image(systemName: shipment.status.icon)
                .font(.caption2)
            
            Text(shipment.status.title)
                .font(.caption2.bold())
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(shipment.status.color.opacity(0.12))
        .foregroundColor(shipment.status.color)
        .clipShape(Capsule())
    }
}
