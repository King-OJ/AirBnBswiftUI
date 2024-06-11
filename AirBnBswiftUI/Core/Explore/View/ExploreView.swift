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
                SearchDestinationView(showView: $showSearchDestinationView, viewModel: viewModel)
            }
            else {
                VStack {
                    SearchAndFilterView(viewModel: viewModel)
                        .padding(.horizontal)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showSearchDestinationView.toggle()
                            }
                        }
                
                
                    ScrollView {
                        
                        LazyVStack(spacing: 30, content: {
                            if !viewModel.searchDestination.isEmpty
                                &&
                                viewModel.filteredListings.isEmpty
                            {
                                HStack {
                                    VStack(alignment: .leading, spacing:6) {
                                        Text("There is no apartment in \(viewModel.searchDestination)")
                                            
                                        
                                        Text("But here are other suggestions we think you might like")
                                            .foregroundStyle(.gray)
                                    }
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                
                            }
                                
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
