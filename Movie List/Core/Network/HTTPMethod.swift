//
//  HTTPMethod.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
    
    var isGet: Bool {
        return self == .GET
    }
}
