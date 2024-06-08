//
//  ExploreView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 29/05/2024.
//

import SwiftUI


struct ExploreView: View {
    
    @State private var showSearchDestinationView = false
    
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    
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
                            ForEach(viewModel.listings) { listing in
                                NavigationLink {
                                    ListingDetailView(listing: listing)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ListingItemView(listing: listing)
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
