//
//  ExploreViewModel.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 07/06/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchDestination = ""
    @Published var filteredListings: Array = []
    
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService){
        self.service = service
        
        Task{
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch  {
            print("Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func fetchListingsForSingleLocation(){
        let filteredListings = listings.filter {Listing in
            Listing.state.lowercased() == searchDestination.lowercased() ||
            Listing.city.lowercased() == searchDestination.lowercased()
        }
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
        self.filteredListings = filteredListings.isEmpty ? [] : filteredListings
    }
}
