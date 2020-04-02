//
//  Gif.swift
//  GiphySearchIOS
//
//  Created by Cao Mai on 4/1/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation

/// Array of Gif objects
struct GifArray: Decodable {
    var gifs: [Gif]
    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}

/// Contains giphy properties
struct Gif: Decodable {
    var gifSources: GifImages
    enum CodingKeys: String, CodingKey {
        case gifSources = "images"
    }
    /// Return download url of the original gif
    func getGifURL() -> String {
        return gifSources.original.url
    }
}

/// Stores the original Gif
struct GifImages: Decodable {
    var original: original
    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}

/// URL to data of GIf
struct original: Decodable{
    var url: String
}
