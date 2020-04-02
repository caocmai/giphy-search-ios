//
//  ViewController.swift
//  GiphySearchIOS
//
//  Created by Cao Mai on 4/1/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var network = GifNetwork()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "What's your favorite gif?"
        searchBar.returnKeyType = .search
    }
    
    func searchGifs(searchText: String) {
        network.fetchGifs(searchTerm: searchText)
    }


}


// MARK: - Tableview functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifCell", for: indexPath) as! GifCell
        return cell
    }
}

// MARK: - Search bar functions
extension ViewController: UISearchTextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != nil {
            print(textField.text!)
            searchGifs(searchText: textField.text!)
        }
        return true
    }
}
