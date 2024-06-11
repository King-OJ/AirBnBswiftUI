//
//  ListingDetailView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 03/06/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    var listing: Listing
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: .regionForCity(stateName: listing.state) , span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottom) {
                
                ScrollView {
                   
                    ListingImagesCarouselView(listing: listing)
                            .frame(height: 320)
                    
                    VStack(alignment: .leading, spacing: 12, content: {
                        Text(listing.title)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading, content: {
                            HStack(spacing: 2, content: {
                                Image(systemName: "star.fill")
                                Text("4.86")
                                
                                Text("-")
                                
                                Text("28 reviews")
                                    .fontWeight(.semibold)
                                    .underline()
                            })
                            .foregroundStyle(.black)
                            
                            Text("\(listing.city), \(listing.state)")
                        })
                        .font(.caption)
                    })
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    //host info
                    HStack{
                        VStack(alignment: .leading, spacing: 4 ,content: {
                            Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                                .font(.headline)
                                
                            
                           
                            Text("\(listing.numOfguests) guests - \(listing.numOfBedrooms) bedrooms - \(listing.numOfBeds) beds - \(listing.numOfBathrooms) baths")
                                .font(.caption)
                        })
                        .frame(maxWidth: 250, alignment: .leading)
                        
                        Spacer()
                        
                        Image(listing.ownerImgUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    //listing features
                    VStack(alignment: .leading , spacing: 14 ,content: {
                        ForEach(listing.categories, id: \.self) { category in
                            HStack(spacing: 12, content: {
                                Image(systemName: category.iconName)
                                
                                VStack(alignment: .leading, content: {
                                    Text(category.title)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                    Text(category.description)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                })
                                
                                Spacer()
                            })
                        }
                    })
                    .padding()
                    
                    Divider()
                    
                    //bedroom scrollview
                    VStack(alignment: .leading, spacing: 14,content: {
                        Text("Where you'll sleep")
                            .font(.headline)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16, content: {
                                ForEach(1...listing.numOfBedrooms, id: \.self) { bedroom in
                                    VStack(alignment: .leading, spacing: 6) {
                                        Image(systemName: "bed.double")
                                        
                                        Text("Bedroom \(bedroom)")
                                    }
                                    .padding(20)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1)
                                            .foregroundStyle(.gray)
                                    }
                                }
                            })
                        }
                        .scrollTargetBehavior(.paging)
                    })
                    .padding()
                    
                    Divider()
                    
                    //listing amenities
                    VStack(alignment: .leading ,spacing:14, content: {
                        Text("What this place offers")
                            .font(.headline)
                        ForEach(listing.features, id: \.self) { feature in
                            HStack(content: {
                                Image(systemName: feature.iconName)
                                    .frame(width: 32)
                                
                                Text(feature.title)
                                    .font(.footnote)
                                
                                Spacer()
                            })
                        }
                        
                    })
                    .padding()
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Where you'll be")
                            .font(.headline)
                        
                        Map(position: $cameraPosition)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding()
                    
                }.padding(.bottom, 80)
                
                //fixed bottom reserve button
                VStack(content: {
                    Divider()
                        .padding(.bottom, 4)
                    
                    HStack(content: {
                        //info view
                        VStack(alignment: .leading, spacing: 2 ,content: {
                            Text("$\(listing.pricePerNight)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Total before taxes")
                                .font(.footnote)
                            
                            Text("Oct 15 - 20")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .underline()
                            
                            
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Reserve")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 120, height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        })
                    })
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                })
                .padding(.bottom)
                .background(.white)
                
                
            }
            
            
//            Button(action: {
//                dismiss()
//            }, label: {
//                Image(systemName: "chevron.left")
//                    .foregroundStyle(.black)
//                    .background{
//                        Circle()
//                            .fill(.white)
//                            .frame(width: 34, height: 34)
//                    }
//                    .padding(32)
//                    
//            })
            
            
            
            VStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .padding(12)
                        
                })
                .background(.white)
                .clipShape(Circle())
            }
            .padding(.leading, 16)
            .padding(.top, 32)
            
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView(listing: MockData.shared.listings[0])
}
