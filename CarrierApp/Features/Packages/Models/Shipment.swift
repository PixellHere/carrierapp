//
//  Shipment.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct Shipment: Identifiable, Hashable {
    let id: String
    let number: String
    let status: ShipmentStatus
    
    let senderInfo: ContactInfo
    let recipientInfo: ContactInfo
}

struct ContactInfo: Hashable {
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
    let country: String
    let city: String
    let zipCode: String
    let street: String
    let house: String
    let apartment: String
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
