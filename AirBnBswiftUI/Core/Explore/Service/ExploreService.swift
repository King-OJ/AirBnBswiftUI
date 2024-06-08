//
//  ExploreService.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 07/06/2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing]{
        return MockData.shared.listings
    }
    
}
