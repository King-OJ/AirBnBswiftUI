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
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottom) {
                
                ScrollView {
                   
                    ListingImagesCarouselView()
                            .frame(height: 320)
                    
                    VStack(alignment: .leading, spacing: 12, content: {
                        Text("Maimi Villa")
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
                            
                            Text("Maimi, Florida")
                        })
                        .font(.caption)
                    })
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    //host info
                    HStack{
                        VStack(alignment: .leading, spacing: 4 ,content: {
                            Text("Entire Villa hosted by KingOJ")
                                .font(.headline)
                                
                            
                           
                            Text("4 guests - 4 bedrooms - 4 beds - 3 baths")
                                .font(.caption)
                        })
                        .frame(maxWidth: 250, alignment: .leading)
                        
                        Spacer()
                        
                        Image("profile-img")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    //listing features
                    VStack(alignment: .leading , spacing: 14 ,content: {
                        ForEach(0..<2, id: \.self) { feature in
                            HStack(spacing: 12, content: {
                                Image(systemName: "medal")
                                
                                VStack(alignment: .leading, content: {
                                    Text("Superhost")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                    Text("Superhost are experienced, highly rated hosts who are commited to providing great stars for guests")
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
                                ForEach(1...4, id: \.self) { bedroom in
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
                        ForEach(1...5, id: \.self) { offer in
                            HStack(content: {
                                Image(systemName: "wifi")
                                    .frame(width: 32)
                                
                                Text("Wifi")
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
                        
                        Map()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding()
                    
                }.padding(.bottom, 80)
                
                //fixed bottom reserve button
                VStack(content: {
                    Divider()
                        .padding(.bottom)
                    
                    HStack(content: {
                        //info view
                        VStack(alignment: .leading ,content: {
                            Text("$500")
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
                    .padding()
                })
                .padding(.bottom)
                .background(.white)
                
                
            }
            
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background{
                        Circle()
                            .fill(.white)
                            .frame(width: 34, height: 34)
                    }
                    .padding(32)
            })
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
}
