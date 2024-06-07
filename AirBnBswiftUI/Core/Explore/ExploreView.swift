//
//  ExploreView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 29/05/2024.
//

import SwiftUI


struct ExploreView: View {
    
    @State private var showSearchDestinationView = false
    
    var body: some View {
        
        NavigationStack{
            
            if showSearchDestinationView {
                SearchDestinationView(showView: $showSearchDestinationView)
            }
            else {
                VStack {
                    SearchAndFilterView()
                        .padding(.horizontal)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showSearchDestinationView.toggle()
                            }
                        }
                
                
                    ScrollView {
                        
                        LazyVStack(spacing: 32, content: {
                            ForEach(1...5, id: \.self) { listing in
                                NavigationLink {
                                    ListingDetailView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ListingItemView()
                                        .frame(height: 400)
                                }

    //                            NavigationLink(value: listing) {
    //                                ListingItemView()
    //                                    .frame(height: 400)
    //                            }
                                
                            }
                        })
                        .padding()
                    }
    //                .navigationDestination(for: Int.self) { listing in
    //                    ListingDetailView()
    //                }
                
                }
            }
            
        }
    }
}

#Preview {
    ExploreView()
}
