//
//  ProductsByCategoryView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 19.12.23.
//

import SwiftUI

struct ProductsByCategoryView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    
    let category: String
    
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
                HeaderComponentView(headerText: "shop by category", secondaryText: category)
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
                ForEach(viewModel.products.filter { $0.category == category }) { product in
                    NavigationLink(value: product) {
                        productSetup(product)
                    }
                    .navigationDestination(for: Product.self) { product in
                        ProductDetailsView( product: product)
                    }
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
    ProductsByCategoryView( category: "fragrances")
        .environmentObject(MainViewModel())
}
