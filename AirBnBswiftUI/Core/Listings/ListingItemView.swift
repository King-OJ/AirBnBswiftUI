//
//  ListingItemView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 31/05/2024.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = ["listing-1", "listing-2", "listing-3", "listing-4" ]
    
    var body: some View {
        VStack(spacing: 8, content: {
            //images
            
            TabView(content: {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            })
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            //listing details
            HStack(alignment: .top , content: {
                //details
                VStack(alignment: .leading ,content: {
                    Text("Maimi, Florida")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4, content: {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    })
                    
                })
                
                Spacer()
                
                //rating
                HStack(spacing: 2, content: {
                    Image(systemName: "star.fill")
                    Text("4.86")
                })
                
            })
            .font(.footnote)
            
        })
    }
}

#Preview {
    ListingItemView()
}
