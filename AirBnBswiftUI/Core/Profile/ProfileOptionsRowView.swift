//
//  ProfileOptionsRowView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 06/06/2024.
//

import SwiftUI

struct ProfileOptionsRowView: View {
    
    let icon: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileOptionsRowView(icon: "gear", title: "Settings")
}
