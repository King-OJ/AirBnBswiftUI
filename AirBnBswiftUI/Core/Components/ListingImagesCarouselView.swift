//
//  ListingImagesCarouselView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 03/06/2024.
//

import SwiftUI

struct ListingImagesCarouselView: View {
    
    var images = ["listing-1", "listing-2", "listing-3", "listing-4" ]
    
    var body: some View {
        TabView(content: {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        })
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImagesCarouselView()
}
