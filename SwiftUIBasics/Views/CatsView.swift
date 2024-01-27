//
//  CatsView.swift
//  SwiftUIBasics
//
//  Created by Luis Ezcurdia on 15/12/23.
//

import SwiftUI

// Hash map cache
private class ImageCache {
    static private var cache: [URL: Image] = [:]

    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}

struct CacheAsyncImage<Content>: View where Content: View {
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content

    init(
        url: URL,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        if let cached = ImageCache[url] {
            _ = print("Rendering from cache at:\(url)")
            content(.success(cached))
        } else {
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }

    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            print("Storing into cache")
            ImageCache[url] = image
        }

        return content(phase)
    }
}

struct CatsView: View {
    var body: some View {
        List {
            ForEach((1..<10)) { _ in
                CacheAsyncImage(url: URL(string: "https://wallpapercave.com/wp/wp3516314.jpg")!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure(let error):
                        EmptyView()
                    @unknown default:
                        fatalError()
                    }
                }
//                AsyncImage(url: URL(string: "https://wallpapercave.com/wp/wp3516314.jpg")) { image in
//                    image
//                        .resizable()
//                        .scaledToFit()
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: .infinity, height: 120)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    CatsView()
}
