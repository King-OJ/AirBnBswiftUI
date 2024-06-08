//
//  Listing.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 07/06/2024.
//

import Foundation

struct Listing : Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImgUrl: String
    let numOfBedrooms: Int
    let numOfBathrooms: Int
    let numOfguests: Int
    let numOfBeds: Int
    
    var imgUrls: [String]
    
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    
    
    let address: String
    let city: String
    let state: String
    
    let title: String
    let rating: Double
    
    var features:[ListingFeatures]
    var categories: [ListingCategories]
    let type: ListingType

}

enum ListingFeatures: Int, Codable, Hashable, Identifiable {
    
    var id: Int { return self.rawValue }
    case pool
    case wifi
    case tv
    case alarmSystem
    case office
    case balcony
    case laundry
    case kitchen
    
    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .wifi:
            return "WiFi"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        case .laundry:
            return "Laundry"
        case .kitchen:
            return "Kitchen"
        }
    }
    
    var iconName: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .wifi:
            return "wifi"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkerboard.shield"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcony:
            return "building"
        case .laundry:
            return "washer"
        case .kitchen:
            return "fork.knife"
        }
    }
}

enum ListingCategories: Int, Codable, Hashable, Identifiable {
    var id: Int { return self.rawValue }
    
    case selfCheckIn
    case superHost
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self Check-In"
        case .superHost:
            return "Superhost"
        }
    }
    
    var iconName: String {
        switch self {
        case .superHost:
            return "medal"
        case .selfCheckIn:
            return "door.left.hand.open"
            
        }
    }
            
    var description: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad"
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are commited to providing great stars for guests"
        }
    }
    
}

enum ListingType: Int, Codable, Hashable, Identifiable {
    var id: Int { return self.rawValue }
    
    case apartment
    case house
    case villa
    case townHouse
    
    var description: String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .villa:
            return "Villa"
        case .townHouse:
            return "Town House"
        }
    }
}


