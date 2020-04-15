//
//  ListMovieInterfaces.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

protocol IListMovieView: class {
    func reloadView()
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
    func showLoading(_ show: Bool)
}

protocol IListMovieInteractor {
    func getListMovie(page: Int, genreId: Int, completion: @escaping ((ListMovieModel?, ErrorType?) -> Void))
}

protocol IListMoviePresenter {
    func setView(_ view: IListMovieView)
    func viewWillAppear()
    func getTitlePage() -> String
    func getNumberOfRows() -> Int
    func getImageURL(at index: Int) -> URL?
    func getTitleMovie(at index: Int) -> String
    func getRate(at index: Int) -> Double
    func getOverview(at index: Int) -> String
    func willDisplayCell(at index: Int)
    func didSelectMovie(at index: Int)
}

protocol IListMovieWireframe {
    func navigateToDetailMovie(with id: Int)
}
