//
//  ReviewsMovieModule.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class ReviewsMovieModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = ReviewsMovieViewModel(movieId: params["id"] as! Int)
        let interactor = ReviewsMovieInteractor(request: HTTPRequest())
        let presenter = ReviewsMoviePresenter(viewModel: viewModel, interactor: interactor)
        let view = ReviewsMovieViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
