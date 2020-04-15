//
//  DetailMovieInterfaces.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

protocol IDetailMovieView: class {
    func reloadView()
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
    func showLoading(_ show: Bool)
}

protocol IDetailMovieInteractor {
    func getDetailMovie(movieId: Int, completion: @escaping ((DetailMovieModel?, ErrorType?) -> Void))
}

protocol IDetailMoviePresenter {
    func setView(_ view: IDetailMovieView)
    func viewWillAppear()
    func getTitlePage() -> String
    func getImageURL() -> URL?
    func getTitleMovie() -> String
    func getRate() -> String
    func getGenre() -> String
    func getOverview() -> String
    func getReleaseDate() -> String
    func didSelectReviews()
}

protocol IDetailMovieWireframe {
    func navigateToListReviews(with id: Int)
}
