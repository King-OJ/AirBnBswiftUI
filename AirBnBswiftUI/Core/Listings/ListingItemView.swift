//
//  ListingItemView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 31/05/2024.
//

import SwiftUI

struct ListingItemView: View {
    
    var body: some View {
        VStack(spacing: 8, content: {
            //images
            ListingImagesCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack(alignment: .top , content: {
                //details
                VStack(alignment: .leading ,content: {
                    Text("Maimi, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4, content: {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    })
                    .foregroundStyle(.black)
                    
                })
                
                Spacer()
                
                //rating
                HStack(spacing: 2, content: {
                    Image(systemName: "star.fill")
                    Text("4.86")
                })
                .foregroundStyle(.black)
                
            })
            .font(.footnote)
            
        })
    }
}

#Preview {
    ListingItemView()
}
