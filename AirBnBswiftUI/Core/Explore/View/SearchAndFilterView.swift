//
//  SearchAndFilterView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 31/05/2024.
//

import SwiftUI

struct SearchAndFilterView: View {
    
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        HStack(content: {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2, content: {
                Text(viewModel.searchDestination.isEmpty ? "Where to?" : viewModel.searchDestination)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                
                Text("\(viewModel.searchDestination.isEmpty || !viewModel.searchDestination.isEmpty && viewModel.filteredListings.isEmpty  ? "Anywhere," : "") Any week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        })
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.3), radius: 2)
        }
    }
}

#Preview {
    SearchAndFilterView(viewModel: ExploreViewModel(service: ExploreService()))
}
