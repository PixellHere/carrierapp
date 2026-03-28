//
//  MapView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 06/03/2026.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 52.2297,
            longitude: 21.0122
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.08,
            longitudeDelta: 0.08
        )
    )
    
    @State private var selectedPoint: MapPoint?
    
    let points: [MapPoint] = [
        MapPoint(
            id: "WAW001",
            name: "Warehouse Warsaw",
            street: "Marszałkowska 10",
            openHours: "08:00 - 18:00",
            coordinate: CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0122)
        ),
        MapPoint(
            id: "WAW002",
            name: "Pickup Point Wola",
            street: "Prosta 18",
            openHours: "09:00 - 20:00",
            coordinate: CLLocationCoordinate2D(latitude: 52.2369, longitude: 20.9836)
        ),
        MapPoint(
            id: "WAW003",
            name: "Pickup Point Mokotów",
            street: "Puławska 45",
            openHours: "08:00 - 19:00",
            coordinate: CLLocationCoordinate2D(latitude: 52.1990, longitude: 21.0450)
        )
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // HEADER
            HStack {
                Text("Points Map")
                    .font(.title3.bold())
                
                Spacer()
                
                Image(systemName: "bell")
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            
            // MAP
            Map(coordinateRegion: $region, annotationItems: points) { point in
                
                MapAnnotation(coordinate: point.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1.0)) {
                    
                    VStack(spacing: 8) {
                        
                        // INFO BOX
                        VStack(alignment: .leading, spacing: 4) {
                            
                            HStack {
                                Text(point.name).font(.caption.bold())
                                Spacer()
                                Button {
                                    withAnimation(.easeInOut) {
                                        selectedPoint = nil
                                    }
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Text("ID: \(point.id)")
                                .font(.caption2)
                            
                            Text(point.street)
                                .font(.caption2)
                            
                            Text("Hours: \(point.openHours)")
                                .font(.caption2)
                            
                            HStack {
                                Text("Continue").font(.caption.bold()).foregroundColor(.blue).underline()
                            }
                        }
                        .padding(8)
                        .frame(width: 160)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .opacity(selectedPoint?.id == point.id ? 1.0 : 0.0)
                        .disabled(selectedPoint?.id != point.id)
                        
                        // MARKER
                        Button {
                            withAnimation(.easeInOut) {
                                selectedPoint = point
                                region.center = point.coordinate
                            }
                        } label: {
                            Image(systemName: "shippingbox.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                    }
                }
            }
        }
    }
}

struct MapPoint: Identifiable {
    let id: String
    let name: String
    let street: String
    let openHours: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
