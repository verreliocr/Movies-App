//
//  ListMovieWireframe.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ListMovieWireframe: IListMovieWireframe {
    let appRouter: IRouter
    
    init(appRouter: IRouter) {
        self.appRouter = appRouter
    }
    
    func navigateToDetailMovie(with id: Int) {
        appRouter.push(module: .detailMovie,
                       using: ["id": id])
    }
}
