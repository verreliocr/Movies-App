//
//  ListMovieModule.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class ListMovieModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = ListMovieViewModel(genreId: params["genreId"] as! Int,
                                           genreName: params["genreName"] as! String)
        let interactor = ListMovieInteractor(request: HTTPRequest())
        let wireframe = ListMovieWireframe(appRouter: router)
        let presenter = ListMoviePresenter(viewModel: viewModel, interactor: interactor, wireframe: wireframe)
        let view = ListMovieViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
