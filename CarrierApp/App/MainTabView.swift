//
//  MainTabView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 27/02/2026.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            ShipmentsView()
                .tabItem {
                    Label("Shipments", systemImage: "cube.box")
                }
                .tag(1)

            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(2)
//
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person")
//                }
//                .tag(3)
        }
    }
}
