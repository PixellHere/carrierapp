//
//  Shipment.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct Shipment: Identifiable {
    let id: String
    let number: String
    let subtitle: String
    let status: ShipmentStatus
}

enum ShipmentStatus {
    case newParcel
    case inTransit
    case delivered
    
    var color: Color {
        switch self {
        case .newParcel: return .orange
        case .inTransit: return .blue
        case .delivered: return .green
        }
    }
    
    var title: String {
        switch self {
        case .newParcel: return "NEW"
        case .inTransit: return "IN TRANSIT"
        case .delivered: return "DELIVERED"
        }
    }
    
    var icon: String {
        switch self {
        case .newParcel: return "shippingbox.fill"
        case .inTransit: return "truck.box.fill"
        case .delivered: return "checkmark.seal.fill"
        }
    }
}
