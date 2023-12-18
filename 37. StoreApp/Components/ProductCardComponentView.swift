//
//  ProductCardComponentView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct ProductCardComponentView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    // MARK: - Components
    var id: Int
    var thumbnailImage: String
    var productName: String
    var productPrice: Int
    var rating: Double
    var chosenQuantity: Int
    var stock: Int
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            productImageView
            HStack(alignment: .bottom) {
                productInfo
            }
        }
        .frame(maxWidth: 150)
        .frame(height: 150)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    // MARK: - Product Image
    private var productImageView: some View {
        ImageFromURL(imageString: thumbnailImage)
            .frame(width: 140, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .clipped()

        .overlay(alignment: .topTrailing) {
            ratingLabel
                .padding(5)
        }
        
    }
    
    // MARK: - Product Info
    private var productInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(productName)
                .font(.system(size: 14, weight: .bold))
            HStack {
                Text("$ \(productPrice)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.gray)
                Spacer()
                buttonStack
            }
        }
    }
    
    
    // MARK: - Rating
    private var ratingLabel: some View {
        Label(title: {
            Text(String(format: "%.1f", rating))
                .font(.system(size: 10, weight: .semibold))
                .foregroundStyle(.black)
        }) {
            Image(systemName: "star.fill")
                .foregroundStyle(Color.yellow)
                .font(.system(size: 10))
        }
        .frame(width: 40, height: 18)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(.gray, lineWidth: 1)
        )
    }
    
    //MARK: - Quantity Button
    
    private var buttonStack: some View {
        HStack {
            Button(action: {
                viewModel.removeFromCart(productID: id)
            }) {
                Image(systemName: "minus")
                    .foregroundStyle(Color.init(hex: "A1CE5F"))
                    .font(.system(size: 12))
            }
            .buttonStyle(BorderedButtonStyle())
            .tint(.white)
            .frame(width: 12, height: 12)
            .clipped()
            
            Text("\(chosenQuantity)")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.black)
            
            Button(action: {
                viewModel.addToCart(productID: id)
            }) {
                Image(systemName: "plus")
                    .foregroundStyle(Color.init(hex: "A1CE5F"))
                    .font(.system(size: 12))
            }
            .buttonStyle(BorderedButtonStyle())
            .tint(.white)
            .frame(width: 12, height: 12)
            .clipped()
            .alert(isPresented: $viewModel.stockAlert) {
                Alert(title: Text("out of Stock"), message: Text("Product is out of stock"), dismissButton: .default(Text("OK")))
            }
        }
        .padding(.trailing)
        
    }
}



#Preview {
    ProductCardComponentView(id: 1, thumbnailImage: "https://i.dummyjson.com/data/products/1/thumbnail.jpg", productName: "iPhone 9", productPrice: 549, rating: 4.69, chosenQuantity: 00, stock: 12)
        .environmentObject(MainViewModel())
}
