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
    
    func fetchGifs(searchTerm: String, completion: @escaping (_ response: GifArray?) -> Void) {
        //Create GET url request
//        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=\(apiKey)&q=\(searchTerm)")!
        // Make more sexy
        let url = urlBuilder(searchTerm: searchTerm)
        // Meat!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let e = error {
                print("Error fetching from Giphy: ", e.localizedDescription)
            }
            do {
                // Decode the data into array of Gifs
                DispatchQueue.main.async {
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
            print("Giphy Data: ", data as Any)
        }.resume()
    }
    
    func urlBuilder(searchTerm: String) -> URL {
        let apikey = apiKey
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/gifs/search"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apikey),
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "limit", value: "1") // Edit limit to display more gifs
        ]
        return components.url!
    }
    
}
