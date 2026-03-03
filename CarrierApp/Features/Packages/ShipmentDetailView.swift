//
//  ShipmentDetailView.swift
//  CarrierApp
//
//  Created by Kacper Płachetka on 03/03/2026.
//

import Foundation
import SwiftUI

struct ShipmentDetailView: View {
    
    let shipment: Shipment
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            
            // HEADER
            header
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // TRACKING NUMBER
                    trackingSection
                    
                    // SENDER & RECIPIENT
                    VStack(spacing: 16) {
                        contactCard(
                            title: "Sender",
                            icon: "arrow.up.circle.fill",
                            color: .blue,
                            contact: shipment.senderInfo
                        )
                        
                        contactCard(
                            title: "Recipient",
                            icon: "arrow.down.circle.fill",
                            color: .green,
                            contact: shipment.recipientInfo
                        )
                    }
                    
                    // STATUS
                    statusSection
                }
                .padding()
                .padding(.bottom, 120)
            }
            
            // FLOATING BUTTON
            downloadButton
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarHidden(true)
    }
}

private extension ShipmentDetailView {
    
    var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .frame(width: 36, height: 36)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
            }
            
            Text("Shipment details")
                .font(.headline)
                .frame(maxWidth: .infinity)
            
            Image(systemName: "square.and.arrow.up")
                .frame(width: 36, height: 36)
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}

private extension ShipmentDetailView {
    
    var trackingSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Tracking number")
                .font(.caption)
                .textCase(.uppercase)
                .foregroundColor(.blue.opacity(0.7))
            
            Text(shipment.number)
                .font(.largeTitle.bold())
                .foregroundColor(.blue)
        }
    }
}

private extension ShipmentDetailView {
    
    func contactCard(
        title: String,
        icon: String,
        color: Color,
        contact: ContactInfo
    ) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .frame(width: 40, height: 40)
                    .background(color.opacity(0.15))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("\(contact.firstName) \(contact.lastName)")
                        .font(.headline)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(contact.street) \(contact.house)/\(contact.apartment)")
                Text("\(contact.zipCode) \(contact.city)")
                Text(contact.country)
                    .fontWeight(.medium)
                
                Divider().padding(.vertical, 6)
                
                Text(contact.email)
                Text(contact.phoneNumber)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 6, y: 4)
    }
}

private extension ShipmentDetailView {
    
    var statusSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("Shipment status")
                    .font(.headline)
                
                Spacer()
                
                Text(shipment.status.title)
                    .font(.caption.bold())
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(shipment.status.color)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            
            VStack(spacing: 20) {
                timelineItem(
                    icon: "truck.box.fill",
                    title: "Departed sorting facility",
                    subtitle: "Today • Warsaw",
                    active: true
                )
                
                timelineItem(
                    icon: "building.2.fill",
                    title: "Arrived at branch",
                    subtitle: "Yesterday • Warsaw",
                    active: false
                )
                
                timelineItem(
                    icon: "checkmark",
                    title: "Shipment created",
                    subtitle: "Yesterday • Parcel locker",
                    active: false
                )
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.05), radius: 6, y: 4)
        }
    }
    
    
    func timelineItem(
        icon: String,
        title: String,
        subtitle: String,
        active: Bool
    ) -> some View {
        
        HStack(alignment: .top, spacing: 12) {
            
            Image(systemName: icon)
                .foregroundColor(active ? .white : .gray)
                .frame(width: 28, height: 28)
                .background(active ? Color.blue : Color(.systemGray5))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(active ? .bold : .regular)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

private extension ShipmentDetailView {
    
    var downloadButton: some View {
        VStack {
            Button {
                // akcja PDF
            } label: {
                HStack {
                    Image(systemName: "doc.richtext")
                    Text("Download label (PDF)")
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: .blue.opacity(0.3), radius: 10, y: 6)
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [Color(.systemGroupedBackground), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
        }
    }
}

struct ShipmentDetailView_Previews: PreviewProvider {
    static let mockShipment = Shipment(
        id: "1",
        number: "TRK-882941052",
        status: .inTransit,
        senderInfo: ContactInfo(
            firstName: "Kacper",
            lastName: "Nowak",
            email: "k.nowak@gmail.com",
            phoneNumber: "+48 501 223 445",
            country: "Poland",
            city: "Warsaw",
            zipCode: "00-001",
            street: "Marszałkowska",
            house: "12",
            apartment: "5"
        ),
        recipientInfo: ContactInfo(
            firstName: "Hans",
            lastName: "Müller",
            email: "h.mueller@web.de",
            phoneNumber: "+49 152 33445566",
            country: "Germany",
            city: "Berlin",
            zipCode: "10115",
            street: "Friedrichstraße",
            house: "45",
            apartment: "12"
        )
    )
    static var previews: some View {
        Group {
            ShipmentDetailView(shipment: mockShipment)
                .previewDisplayName("Light Mode")
            
            ShipmentDetailView(shipment: mockShipment)
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
