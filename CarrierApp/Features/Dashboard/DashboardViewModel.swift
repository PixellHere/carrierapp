//
//  DashboardViewModel.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    
    @Published var sentCount: Int = 12
    @Published var deliveredCount: Int = 45
    
    @Published var shipments: [Shipment] = [
        Shipment(
            id: "1",
            number: "#PL-45920-X8",
            subtitle: "On the way to: Warsaw",
            status: .inTransit
        ),
        Shipment(
            id: "2",
            number: "#PL-81203-M2",
            subtitle: "Picked up in: Krakow",
            status: .delivered
        ),
        Shipment(
            id: "3",
            number: "#PL-11928-Z5",
            subtitle: "Preparing for shipment",
            status: .newParcel
        )
    ]
}
