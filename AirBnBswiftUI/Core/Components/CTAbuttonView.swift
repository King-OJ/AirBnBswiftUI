//
//  CTAbuttonView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 06/06/2024.
//

import SwiftUI

struct CTAbuttonView: View {
    
    var title: String
    
    var body: some View {
        Button {
            //
        } label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    CTAbuttonView(title: "Log in")
}
