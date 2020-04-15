//
//  ListGenresModule.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class ListGenresModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = ListGenresViewModel()
        let interactor = ListGenresInteractor(request: HTTPRequest())
        let wireframe = ListGenresWireframe(appRouter: router)
        let presenter = ListGenresPresenter(viewModel: viewModel, interactor: interactor, wireframe: wireframe)
        let view = ListGenresViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
