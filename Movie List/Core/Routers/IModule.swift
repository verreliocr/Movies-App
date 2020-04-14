//
//  IModule.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

protocol IModule {
    var router: IRouter { get set }
    func resolve(using params: [String: Any]) -> UIViewController
}
