//
//  Extension+UICollectionView.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func register(_ cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            register(cell.nib, forCellWithReuseIdentifier: cell.defaultIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.defaultIdentifier, for: indexPath) as? T
    }
}
