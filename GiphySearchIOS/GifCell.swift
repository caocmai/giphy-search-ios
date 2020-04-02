//
//  GifCell.swift
//  GiphySearchIOS
//
//  Created by Cao Mai on 4/1/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class GifCell: UITableViewCell {
    
    /// GIf to be displayed
    var gif: Gif?
    /// ImageView to contain our gif
    var gifView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Add views
        // Make sure cell has a gif object
        if gif != nil {
            // Grab gif from gif obejt and display it inside the imageview
            let gifURL = gif!.getGifURL()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
