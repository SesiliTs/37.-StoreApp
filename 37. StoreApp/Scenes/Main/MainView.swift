//
//  MainView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(hex: "F4F4F4")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                HeaderComponentView(headerText: "don't miss our deals", secondaryText: "SHOP NOW")
                productsGrid
                FooterComponentView(cartQuantity: viewModel.totalCartQuantity, totalPrice: viewModel.totalCartPrice)
            }
            .padding(20)

        }
    }
    
    // MARK: - Grid Setup

    private var productsGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.products) { product in
                    productSetup(product)
                }
            }
        }
    }

    
    private func productSetup(_ product: Product) -> some View {
        ProductCardComponentView(
            id: product.id,
            thumbnailImage: product.thumbnail,
            productName: product.title,
            productPrice: product.price,
            rating: product.rating,
            chosenQuantity: product.chosenQuantity ?? 0 ,
            stock: product.stock
        )
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
