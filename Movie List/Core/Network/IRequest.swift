//
//  IRequest.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

protocol IRequest {
    func call(_ endPoint: EndPoint, bodyParams: [String: Any], completion: @escaping (Data?, ErrorType?) -> Void)
}
