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
        ),
        
        Shipment(
            id: "2",
            number: "TRK-109247712",
            status: .delivered,
            senderInfo: ContactInfo(
                firstName: "Anna",
                lastName: "Kowalska",
                email: "anna.kowalska@onet.pl",
                phoneNumber: "+48 600 112 778",
                country: "Poland",
                city: "Kraków",
                zipCode: "30-001",
                street: "Floriańska",
                house: "8",
                apartment: "3"
            ),
            recipientInfo: ContactInfo(
                firstName: "Peter",
                lastName: "Novák",
                email: "p.novak@centrum.sk",
                phoneNumber: "+421 905 667 889",
                country: "Slovakia",
                city: "Bratislava",
                zipCode: "81101",
                street: "Obchodná",
                house: "21",
                apartment: "7"
            )
        ),
        
        Shipment(
            id: "3",
            number: "TRK-445029183",
            status: .inTransit,
            senderInfo: ContactInfo(
                firstName: "Michał",
                lastName: "Zieliński",
                email: "m.zielinski@gmail.com",
                phoneNumber: "+48 502 998 221",
                country: "Poland",
                city: "Gdańsk",
                zipCode: "80-001",
                street: "Długa",
                house: "14",
                apartment: "9"
            ),
            recipientInfo: ContactInfo(
                firstName: "Lucie",
                lastName: "Svobodová",
                email: "lucie.svobodova@seznam.cz",
                phoneNumber: "+420 731 556 334",
                country: "Czech Republic",
                city: "Prague",
                zipCode: "11000",
                street: "Václavské náměstí",
                house: "32",
                apartment: "18"
            )
        ),
        
        Shipment(
            id: "4",
            number: "TRK-990112348",
            status: .newParcel,
            senderInfo: ContactInfo(
                firstName: "Tomasz",
                lastName: "Lewandowski",
                email: "t.lewandowski@gmail.com",
                phoneNumber: "+48 515 443 112",
                country: "Poland",
                city: "Poznań",
                zipCode: "60-001",
                street: "Półwiejska",
                house: "5",
                apartment: "2"
            ),
            recipientInfo: ContactInfo(
                firstName: "Mantas",
                lastName: "Petrauskas",
                email: "mantas.petrauskas@gmail.com",
                phoneNumber: "+370 612 33445",
                country: "Lithuania",
                city: "Vilnius",
                zipCode: "LT-01100",
                street: "Gedimino pr.",
                house: "10",
                apartment: "6"
            )
        )
    ]
}
