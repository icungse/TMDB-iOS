//
//  ImageCache.swift
//  TMDB-iOS
//
//  Created by Icung on 06/08/23.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View{
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ){
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View{
        if let cached = ImageCache[url]{
            let _ = print("cached: \(String(describing: url?.absoluteString))")
            content(.success(cached))
        } else {
            let _ = print("request: \(String(describing: url?.absoluteString))")
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ) { phase in
                if let _ = phase.image {
                    cacheAndRender(phase: phase)
                } else {
                    Image("place_holder")
                        .resizable()
                }
            }
        }
    }
    func cacheAndRender(phase: AsyncImagePhase) -> some View{
        if case .success (let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}

fileprivate class ImageCache{
    static private var cache: [URL?: Image] = [:]
    static subscript(url: URL?) -> Image?{
        get {
            ImageCache.cache[url]
        }
        
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
