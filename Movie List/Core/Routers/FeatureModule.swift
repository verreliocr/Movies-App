//
//  FeatureModule.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

enum FeatureModule {
    case listGenres

    func create(using router: IRouter) -> IModule {
        switch self {
        case .listGenres:
            return ListGenresModule(appRouter: router)
        }
    }
}
