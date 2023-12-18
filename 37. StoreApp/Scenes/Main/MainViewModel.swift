//
//  MainViewModel.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import NetworkManager
import SwiftUI

final class MainViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var navigationPath = NavigationPath()
    @Published var products = [Product]()
    @Published var stockAlert = false
    @Published var balanceAlert = false
    @Published var balance = 2300
    @Published var isLoading = false
    
    // MARK: - Initialisation
    init() {
        fetchDestinations()
        
    }
    
    //MARK: - Footer View Data
    
    var totalCartQuantity: Int {
        return products.reduce(0) { $0 + ($1.chosenQuantity ?? 0) }
    }
    var totalCartPrice: Int {
        return products.reduce(0) { $0 + (($1.chosenQuantity ?? 0) * $1.price) }
    }
    
    
    //MARK: - Quantity Button Functions
    
    
    func addToCart(productID: Int) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        
        var updatedProduct = products[index]
        if updatedProduct.stock > 0 {
            updatedProduct.chosenQuantity = (updatedProduct.chosenQuantity ?? 0) + 1
            updatedProduct.stock -= 1
            products[index] = updatedProduct
        } else {
            stockAlert = true
        }
    }
    
    func removeFromCart(productID: Int) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        
        var updatedProduct = products[index]
        if (updatedProduct.chosenQuantity ?? 0) > 0 {
            updatedProduct.chosenQuantity = (updatedProduct.chosenQuantity ?? 0) - 1
            updatedProduct.stock += 1
            products[index] = updatedProduct
        }
    }
    
    //MARK: - BuyNow Button Action
    
    func buyNow() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoading = false
            if self.balance >= self.totalCartPrice {
                self.balance -= self.totalCartPrice
                self.resetCart()
                self.balanceAlert = true
            }
            else {
                self.balanceAlert = true
            }
        }
    }
    
    // MARK: - Reset Cart
    func resetCart() {
        for i in 0..<products.count {
            products[i].chosenQuantity = 0
        }
    }
    
    
    // MARK: - Network Call
    func fetchDestinations() {
        let urlString = "https://dummyjson.com/products"
        
        NetworkService.shared.getData(urlString: urlString) { [weak self] (result: Result<ProductData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.products = data.products
            case .failure(let error):
                print(error)
            }
        }
    }
}
