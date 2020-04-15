//
//  ListGenresWireframe.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ListGenresWireframe: IListGenresWireframe {
    let appRouter: IRouter
    
    init(appRouter: IRouter) {
        self.appRouter = appRouter
    }
    
    func navigateToListMovie(with id: Int, and name: String) {
        appRouter.push(module: .listMovies,
                       using: ["genreId": id,
                               "genreName": name])
    }
}
