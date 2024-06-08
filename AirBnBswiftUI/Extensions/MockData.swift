//
//  MockData.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 07/06/2024.
//

import Foundation

class MockData {
    
    static let shared = MockData()
    
    var listings: [Listing] =
    [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Clement Ojigs",
            ownerImgUrl: "profile-img",
            numOfBedrooms: 4, 
            numOfBathrooms: 3,
            numOfguests: 4, 
            numOfBeds: 4,
            imgUrls: ["listing-2", "listing-3", "listing-4", "listing-1"],
            pricePerNight: 490,
            latitude: 25.7850,
            longitude: -80.1936,
            address: "124 Main Str",
            city: "Maimi",
            state: "Florida",
            title: "Maimi Villa",
            rating: 4.86,
            features: [.wifi, .kitchen, .tv, .laundry],
            categories: [.selfCheckIn, .superHost],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Laju Winning",
            ownerImgUrl: "profile-img",
            numOfBedrooms: 2,
            numOfBathrooms: 2,
            numOfguests: 3,
            numOfBeds: 2,
            imgUrls: ["listing-3", "listing-4", "listing-1", "listing-2"],
            pricePerNight: 230,
            latitude: 25.7850,
            longitude: -80.1936,
            address: "Plot 4 King Str",
            city: "Ikeja",
            state: "Lagos",
            title: "Lasgidi Home",
            rating: 3.0,
            features: [.tv, .kitchen, .pool],
            categories: [.selfCheckIn],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Daddys Girl",
            ownerImgUrl: "profile-img",
            numOfBedrooms: 3,
            numOfBathrooms: 3,
            numOfguests: 3,
            numOfBeds: 3,
            imgUrls: ["listing-4", "listing-1", "listing-2", "listing-3"],
            pricePerNight: 350,
            latitude: 25.7850,
            longitude: -80.1936,
            address: "Lady Navy Str",
            city: "FCT",
            state: "Abuja",
            title: "Royal Flat",
            rating: 2.5,
            features: [.tv, .laundry, .pool],
            categories: [.superHost, .selfCheckIn],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Don Clemino",
            ownerImgUrl: "profile-img",
            numOfBedrooms: 5,
            numOfBathrooms: 5,
            numOfguests: 5,
            numOfBeds: 6,
            imgUrls: ["listing-1", "listing-2", "listing-3", "listing-4"],
            pricePerNight: 861,
            latitude: 25.7850,
            longitude: -80.1936,
            address: "4th Avenue Str, Gwarinpa",
            city: "FCT",
            state: "Abuja",
            title: "Luxury Home",
            rating: 5.0,
            features: [.tv, .kitchen, .pool, .alarmSystem, .balcony],
            categories: [.superHost],
            type: .townHouse
        ),
    ]
}
