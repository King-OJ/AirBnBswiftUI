//
//  MainTabBarView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 06/06/2024.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
                
            
            WishListsView()
                .tabItem { Label("Wishlists", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .tint(.pink)
    }
}

#Preview {
    MainTabBarView()
}
