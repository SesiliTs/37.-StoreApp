//
//  ImageCarouselComponentView.swift
//  37. StoreApp
//
//  Created by Sesili Tsikaridze on 19.12.23.
//

import SwiftUI

struct ImageCarouselComponentView: View {
    // MARK: - Properties
    @State private var selectedImageIndex = 0
    var images: [String]

    // MARK: - Body
    var body: some View {
        VStack {
            imageTabView
            indicatorHStack
        }
    }

    // MARK: - ImageTabView
    private var imageTabView: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                imageAtIndex(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 280)
        .onAppear {
            selectedImageIndex = 0
        }
    }

    private var indicatorHStack: some View {
        HStack {
            Spacer()
            ForEach(0..<images.count, id: \.self) { index in
                Circle()
                    .fill(index == selectedImageIndex ? Color.primary : Color.secondary)
                    .frame(width: 8, height: 8)
            }
            Spacer()
        }
    }

    // MARK: - Methods
    private func imageAtIndex(_ index: Int) -> some View {
        ImageFromURL(imageString: images[index])
            .frame(height: 390)
            .frame(maxWidth: .infinity)
            .scaledToFit()
            .tag(index)
    }
}

