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
    case listMovies

    func create(using router: IRouter) -> IModule {
        switch self {
        case .listGenres:
            return ListGenresModule(appRouter: router)
        case .listMovies:
            return ListMovieModule(appRouter: router)
        }
    }
}
