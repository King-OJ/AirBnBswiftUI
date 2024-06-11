//
//  Regions.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 08/06/2024.
//

import CoreLocation

extension CLLocationCoordinate2D {
    static var abuja = CLLocationCoordinate2D(latitude: 9.0563, longitude: 7.4985)
    static var lagos = CLLocationCoordinate2D(latitude: 6.5244, longitude: 3.3792)
    static var delta = CLLocationCoordinate2D(latitude: 6.2059, longitude: 6.6959)
    static var rivers = CLLocationCoordinate2D(latitude: 4.8396, longitude: 6.9112)
    static var akwaIbom = CLLocationCoordinate2D(latitude: 6.5244, longitude: 3.3792)
    static var edo = CLLocationCoordinate2D(latitude: 6.6342, longitude: 5.9304)
    
    static func regionForCity(stateName: String)-> CLLocationCoordinate2D{
        switch stateName {
        case "Abuja":
            return abuja;
        case "Lagos":
            return lagos;
        case "Delta":
            return delta;
        case "Rivers":
            return rivers;
        case "Akwa Ibom":
            return akwaIbom;
        case "Edo":
            return edo;
        default:
            return abuja;
        }
    }
}
