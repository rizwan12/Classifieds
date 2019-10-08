//
//  ListingViewCell.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import Foundation
import UIKit

class ListingViewCell: UITableViewCell {
    
    
    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setValues(item: Item) {
        titleLabel.text = item.name
        priceLabel.text = item.price
        dateLabel.text = item.createdAt
        
        // Load Image
    }
}
