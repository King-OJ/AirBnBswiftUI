//
//  ProfileView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 06/06/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack {
            //title and login buttons
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                
                //login button
               CTAbuttonView(title: "Log in")
                
                //Dont have an account yet
                HStack(content: {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                })
                .font(.caption)
                
            }
            
            //settings
            VStack(spacing: 24, content: {
                ProfileOptionsRowView(icon: "gear", title: "Settings")
                ProfileOptionsRowView(icon: "gear", title: "Accessibility")
                ProfileOptionsRowView(icon: "questionmark.circle", title: "Visit the help center")
            })
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
