//
//  Extension+String.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

extension String {
    func getFirstChar() -> String {
        guard let first = self.first else {
            return ""
        }
        return first.description
    }
}
