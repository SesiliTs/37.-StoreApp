//
//  CategoriesView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct CategoriesView: View {
    
    //MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    
    private var categories: [String] {
        Set(viewModel.products.map { $0.category }).sorted()
    }
    
    private var randomColors = [Color(hex: "#a8e6cf"), Color(hex: "#dcedc1"), Color(hex: "#ffd3b6"), Color(hex: "#ffaaa5"), Color(hex: "#ff8b94")]
    
    //MARK: - Body
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            ZStack {
                Color(hex: "F4F4F4")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HeaderComponentView(
                        headerText: "choose from our",
                        secondaryText: "categories")
                    Spacer()
                    setupCategories
                }
                .padding(20)
            }
        }
    }
    
    //MARK: - Categories UI
    private var setupCategories: some View {
        ScrollView {
            ForEach(0..<categories.count, id: \.self) { index in
                categoriesUI(category: categories[index])
            }
        }
    }
    
    private func categoriesUI(category: String) -> some View {
        NavigationLink(value: category) {
            VStack {
                Text(category.uppercased())
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundStyle(randomColors.randomElement() ?? .black)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
        
        .navigationDestination(for: String.self) { category in
            ProductsByCategoryView(category: category)
        }
    }
    
}

#Preview {
    CategoriesView()
        .environmentObject(MainViewModel())
}

