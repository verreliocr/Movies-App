//
//  Extension+UICollectionViewCell.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var defaultIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: defaultIdentifier, bundle: nil)
    }
}
