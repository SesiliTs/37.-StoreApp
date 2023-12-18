//
//  ContentView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            CategoriesView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
        }
        .tint(Color.init(hex: "A1CE5F"))
    }
}

#Preview {
    TabBarView()
        .environmentObject(MainViewModel())
}
