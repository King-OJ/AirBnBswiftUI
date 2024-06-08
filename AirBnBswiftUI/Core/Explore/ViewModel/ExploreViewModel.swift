//
//  ExploreViewModel.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 07/06/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService){
        self.service = service
        
        Task{
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch  {
            print("Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
