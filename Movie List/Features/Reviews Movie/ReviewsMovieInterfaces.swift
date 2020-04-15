//
//  ReviewsMovieInterfaces.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

protocol IReviewsMovieView: class {
    func reloadView()
    func handleError(type: ErrorType, retryAction: @escaping (() -> Void))
    func showLoading(_ show: Bool)
}

protocol IReviewsMovieInteractor {
    func getReviewsMovie(page: Int, id: Int, completion: @escaping ((ReviewsModel?, ErrorType?) -> Void))
}

protocol IReviewsMoviePresenter {
    func setView(_ view: IReviewsMovieView)
    func viewWillAppear()
    func getTitlePage() -> String
    func getNumberOfRows() -> Int
    func getName(at index: Int) -> String
    func getReview(at index: Int) -> String
    func willDisplayCell(at index: Int)
}
