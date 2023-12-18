//
//  HeaderComponentView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct HeaderComponentView: View {
    var headerText: String
    var secondaryText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(headerText.uppercased())
                Text(secondaryText.uppercased())
                    .foregroundStyle(Color.init(hex: "A1CE5F"))
            }
            .font(.system(size: 20, weight: .bold))
            .fontDesign(.monospaced)
            
            Spacer()
            Image("ProfileImage")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .clipped()
        }
        
        
    }
}

#Preview {
    HeaderComponentView(headerText: "Don't miss out our deals", secondaryText: "SHOP NOW")
}
