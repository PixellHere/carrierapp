//
//  ShipmentsViewModel.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

final class ShipmentsViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var selectedFilter: ShipmentStatus = .newParcel
    
    @Published var shipments: [Shipment] = [
        Shipment(id: "1",
                 number: "TRK-882941052",
                 subtitle: "John Doe • United States",
                 status: .inTransit),
        
        Shipment(id: "2",
                 number: "TRK-109247712",
                 subtitle: "Sarah Jenkins • United Kingdom",
                 status: .delivered),
        
        Shipment(id: "3",
                 number: "TRK-445029183",
                 subtitle: "Michael Chen • Germany",
                 status: .inTransit),
        
        Shipment(id: "4",
                 number: "TRK-990112348",
                 subtitle: "Alice Rivera • Canada",
                 status: .newParcel),
    ]
    
    var filteredShipments: [Shipment] {
        shipments
            .filter { shipment in
                shipment.status == selectedFilter
            }
            .filter { shipment in
                searchText.isEmpty ||
                shipment.number.localizedCaseInsensitiveContains(searchText) ||
                shipment.subtitle.localizedCaseInsensitiveContains(searchText)
            }
    }
}
