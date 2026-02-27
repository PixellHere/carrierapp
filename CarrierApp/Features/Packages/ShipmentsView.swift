//
//  ShipmentsView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct ShipmentsView: View {
    
    @StateObject private var viewModel = ShipmentsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            
            // HEADER
            HStack {
                Text("My Packages")
                    .font(.title3.bold())
                
                Spacer()
                
                Image(systemName: "bell")
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            
            // SEARCH
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
                
                TextField("Search tracking ID or recipient",
                          text: $viewModel.searchText)
                
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .padding(.horizontal)
            .padding(.bottom, 8)
            .background(Color.white)
            
            // FILTERS
            HStack(spacing: 24) {
                filterButton("New Parcels", .newParcel)
                filterButton("In Transit", .inTransit)
                filterButton("Delivered", .delivered)
                Spacer()
            }
            .padding(.horizontal)
            .background(Color.white)
            
            // LIST
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.filteredShipments) { shipment in
                        ShipmentRowView(shipment: shipment)
                    }
                }
            }
            .background(Color.white)
        }
        .background(Color.white)
    }
    
    private func filterButton(_ title: String, _ status: ShipmentStatus) -> some View {
        Button {
            viewModel.selectedFilter = status
        } label: {
            VStack(spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(
                        viewModel.selectedFilter == status ? .blue : .gray
                    )
                
                Rectangle()
                    .fill(
                        viewModel.selectedFilter == status
                        ? Color.blue
                        : Color.clear
                    )
                    .frame(height: 2)
            }
        }
    }
}

struct ShipmentsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShipmentsView()
                .previewDisplayName("Light Mode")
            
            ShipmentsView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
