//
//  ListGenresInterfaces.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

protocol IListGenresView: class {
    func reloadView()
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
    func showLoading(_ show: Bool)
}

protocol IListGenresInteractor {
    func getListGenres(completion: @escaping (([GenreModelItem]?, ErrorType?) -> Void))
}

protocol IListGenresPresenter {
    func setView(_ view: IListGenresView)
    func viewWillAppear()
    func getNumberOfRows() -> Int
    func getGenreName(at index: Int) -> String
    func getBackColor(at index: Int) -> UIColor
    func didSelectGenre(at index: Int)
}

protocol IListGenresWireframe {
    func navigateToListMovie(with id: Int)
}
