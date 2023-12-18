//
//  _7__StoreAppApp.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 18.12.23.
//

import SwiftUI

@main
struct _7__StoreAppApp: App {
    @State var viewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(viewModel)
        }
    }
}
