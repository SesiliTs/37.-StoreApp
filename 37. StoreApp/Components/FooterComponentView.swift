//
//  FooterComponentView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct FooterComponentView: View {
    let cartQuantity: Int
    let totalPrice: Int
    
    var body: some View {
        HStack() {
            Image(systemName: "cart")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 20, height: 20)
            Text(":  \(cartQuantity)")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
            Text(String(format: "%.2f $", totalPrice))
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 20)
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.init(hex: "A1CE5F"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    FooterComponentView(cartQuantity: 12, totalPrice: 346)
}
