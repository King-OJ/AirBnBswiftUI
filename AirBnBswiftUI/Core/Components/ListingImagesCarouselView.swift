//
//  ListingImagesCarouselView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 03/06/2024.
//

import SwiftUI

struct ListingImagesCarouselView: View {
    
    var listing: Listing
    
    var body: some View {
        TabView(content: {
            ForEach(listing.imgUrls, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        })
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImagesCarouselView(listing: MockData.shared.listings[0])
}
