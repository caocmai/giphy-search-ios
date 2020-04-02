//
//  GifNetwork.swift
//  GiphySearchIOS
//
//  Created by Cao Mai on 4/1/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation

class GifNetwork {
    let apiKey = "zKp7WAFpcG9WLF792jgrv9QpiJBWnO6N"
    
    func fetchGifs(searchTerm: String) {
        //Create GET url request
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=\(apiKey)&q=\(searchTerm)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let e = error {
                print("Error fetching from Giphy: ", e.localizedDescription)
            }
            print("Giphy Data: ", data as Any)
        }.resume()
    }
    
}
