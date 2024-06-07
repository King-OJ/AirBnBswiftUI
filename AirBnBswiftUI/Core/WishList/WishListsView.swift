//
//  WishListsView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 06/06/2024.
//

import SwiftUI

struct WishListsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32, content: {
                
                VStack(alignment: .leading, spacing: 4 ,content: {
                    Text("Login to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create,view or edit your wishlists once you have logged in")
                        .font(.footnote)
                })
                
                //login button
                CTAbuttonView(title: "Log in")
                
                Spacer()
            })
            .padding()
            .navigationTitle("WishLists")
        }
    }
}

#Preview {
    WishListsView()
}
