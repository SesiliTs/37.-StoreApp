//
//  ProductDetailsView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 19.12.23.
//

import SwiftUI

struct ProductDetailsView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    let product: Product
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Color(hex: "F4F4F4")
                .ignoresSafeArea()
            VStack {
                ImageCarouselComponentView(images: product.images)
                    .ignoresSafeArea()
                productInfo
                Spacer()
                backToCategoriesButton
            }
        }
    }
    
    //MARK: - Product info
    private var productInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(product.title.uppercased())
                .font(.system(size: 18, weight: .bold))
            HStack {
                Text(product.brand)
                Spacer()
                Text("$ \(product.price)")
            }
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(.gray)
            
            Text(product.description)
                .padding(.top, 30)

        }
        .padding(20)
    }
    
    //MARK: - Back Button
    private var backToCategoriesButton: some View {
        VStack {
            Button("BACK TO CATEGORIES"){
                viewModel.navigationPath.removeLast(viewModel.navigationPath.count)
            }
                .font(.system(size: 16, weight: .bold, design: .monospaced))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .foregroundStyle(.white)
        .background(Color(hex: "A1CE5F"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    ProductDetailsView(product: Product(
        id: 19,
        title: "Skin Beauty Serum.",
        description: "Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m",
        price: 46,
        discountPercentage: 10.68,
        rating: 4.42,
        stock: 54,
        brand: "ROREC White Rice",
        category: "skincare",
        thumbnail: "https://i.dummyjson.com/data/products/19/thumbnail.jpg",
        images: [
            "https://i.dummyjson.com/data/products/19/1.jpg",
            "https://i.dummyjson.com/data/products/19/2.jpg",
            "https://i.dummyjson.com/data/products/19/3.png",
            "https://i.dummyjson.com/data/products/19/thumbnail.jpg"
        ])
    )
}
