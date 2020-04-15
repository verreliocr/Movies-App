//
//  GenreCollectionCell.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class GenreCollectionCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(genre: String, color: UIColor) {
        genreLabel.text = genre
        backView.backgroundColor = color
    }

}
