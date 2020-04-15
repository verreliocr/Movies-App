//
//  DetailMovieModule.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class DetailMovieModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = DetailMovieViewModel(movieId: params["id"] as! Int)
        let interactor = DetailMovieInteractor(request: HTTPRequest())
        let wireframe = DetailMovieWireframe(appRouter: router)
        let presenter = DetailMoviePresenter(viewModel: viewModel, interactor: interactor, wireframe: wireframe)
        let view = DetailMovieViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
