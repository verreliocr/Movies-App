//
//  MovieItemTableCell.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class MovieItemTableCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UIButton!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(imageUrl: URL?, title: String, rate: Double, overview: String) {
        if let url = imageUrl {
            thumbnailImageView.setImage(url: url, placeholder: nil)
            thumbnailImageView.isHidden = false
        }else{
            thumbnailImageView.isHidden = true
        }
        titleLabel.text = title
        rateLabel.setTitle(rate.description, for: .normal)
        overviewLabel.text = overview
    }
    
}
