//
//  FooterComponentView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct FooterComponentView: View {
    
    //MARK: - Properties
    let cartQuantity: Int
    let totalPrice: Int
    
    @EnvironmentObject var viewModel: MainViewModel
    
    
    //MARK: - Body
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
            Text("$ \(totalPrice)")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
            
            Button(action: {
                        viewModel.isLoading = true
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            buyNowButton
                        }
                        
                    }
            .alert(isPresented: $viewModel.balanceAlert) {
                Alert(
                    title: Text("Payment " + (viewModel.balance >= viewModel.totalCartPrice ? "Successful" : "Failed")),
                    message: Text("Your payment has " + (viewModel.balance >= viewModel.totalCartPrice ? "succeeded." : "failed. Please check your balance.")),
                    dismissButton: .default(Text("OK")) {
                    }
                )
            }
            .font(.system(size: 14, weight: .bold, design: .monospaced))
            .padding(10)
            .background(.white)
            .foregroundStyle(Color(hex: "A1CE5F"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
        .padding(.horizontal, 20)
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.init(hex: "A1CE5F"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    //MARK: - Buy Now Button
    
    private var buyNowButton: some View {
        Button("BUY NOW") {
            viewModel.buyNow()
        }
    }
}



#Preview {
    FooterComponentView(cartQuantity: 12, totalPrice: 346)
}
