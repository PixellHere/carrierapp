//
//  DashboardView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    DashboardHeaderView(userName: "Aleksander")
                    
                    // Stats grid
                    HStack(spacing: 16) {
                        StatsCardView(
                            icon: "tray.and.arrow.up.fill",
                            value: "\(viewModel.sentCount)",
                            title: "Sent packages",
                            color: .blue
                        )
                        
                        StatsCardView(
                            icon: "checkmark.seal.fill",
                            value: "\(viewModel.deliveredCount)",
                            title: "Delivered packages",
                            color: .green
                        )
                    }
                    
                    // Primary button
                    Button {
                        print("Create shipment tapped")
                    } label: {
                        Label("Create new shipment",
                              systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .shadow(color: .blue.opacity(0.3), radius: 8)
                    }
                    
                    // Recent shipments
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack {
                            Text("Recent shipments")
                                .font(.title3.bold())
                            
                            Spacer()
                            
                            Button("See all") {
                                print("See all tapped")
                            }
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(.blue)
                        }
                        
                        ForEach(viewModel.shipments) { shipment in
                            ShipmentRowView(shipment: shipment)
                        }
                    }
                }
                .padding()
                .padding(.bottom, 80)
            }
            .navigationBarHidden(true)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
                .previewDisplayName("Light Mode")
            
            DashboardView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
        // Jeśli Dashboard używa EnvironmentObject:
        //.environmentObject(AppState())
    }
}
