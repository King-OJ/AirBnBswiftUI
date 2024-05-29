//
//  ExploreView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 29/05/2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        NavigationStack{
            VStack {
                SearchAndFilterView()
                    .padding(.horizontal)
            
            
                ScrollView {
                    
                    LazyVStack(spacing: 32, content: {
                        ForEach(1...5, id: \.self) { listing in
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    })
                    .padding()
                }
            
            }
        }
    }
}

#Preview {
    ExploreView()
}
