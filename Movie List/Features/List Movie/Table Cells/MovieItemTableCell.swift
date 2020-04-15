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
    @IBOutlet weak var expandButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        expandButton.addAction { [unowned self] in
            self.didSelectExpandButton()
        }
    }
    
    func bind(imageUrl: URL, title: String, rate: Double, overview: String) {
        thumbnailImageView.setImage(url: imageUrl, placeholder: nil)
        titleLabel.text = title
        rateLabel.setTitle(rate.description, for: .normal)
        overviewLabel.text = overview
    }
    
    @objc func didSelectExpandButton() {
        if expandButton.imageView?.image == UIImage(systemName: "arrowtriangle.down") {
            overviewLabel.isHidden = false
            expandButton.setImage(UIImage(systemName: "arrowtriangle.down"), for: .normal)
        }else{
            overviewLabel.isHidden = true
            expandButton.setImage(UIImage(systemName: "arrowtriangle.up"), for: .normal)
        }
    }
    
}
