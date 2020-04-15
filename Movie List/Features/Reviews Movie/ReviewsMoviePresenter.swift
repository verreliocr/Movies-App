//
//  ReviewsMoviePresenter.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ReviewsMoviePresenter: IReviewsMoviePresenter {
    
    weak var view: IReviewsMovieView?
    let viewModel: ReviewsMovieViewModel
    let interactor: IReviewsMovieInteractor
    
    init(viewModel: ReviewsMovieViewModel, interactor: IReviewsMovieInteractor) {
        self.viewModel = viewModel
        self.interactor = interactor
    }
    
    func setView(_ view: IReviewsMovieView) {
        self.view = view
    }
    
    func viewWillAppear() {
        getReviewsMovie()
    }
    
    private func getReviewsMovie(appendResult: Bool = false, completion: ((ErrorType?) -> Void)? = nil) {
        view?.showLoading(true)
        interactor.getReviewsMovie(page: viewModel.page, id: viewModel.movieId) { [weak self] data, type in
            self?.view?.showLoading(false)
            if let data = data {
                self?.viewModel.totalPages = data.totalPages ?? 0
                self?.viewModel.totalElements = data.totalResults ?? 0
                if appendResult {
                    self?.viewModel.reviews.append(contentsOf: data.results)
                } else {
                    self?.viewModel.reviews = data.results
                }
                self?.view?.reloadView()
            }
            if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getReviewsMovie(appendResult: appendResult)
                })
            }
            completion?(type)
        }
    }
    
    func getTitlePage() -> String {
        return "List Reviews"
    }
    
    func getNumberOfRows() -> Int {
        return viewModel.reviews.count
    }
    
    func getName(at index: Int) -> String {
        return viewModel.reviews[index].author ?? ""
    }
    
    func getReview(at index: Int) -> String {
        return viewModel.reviews[index].content ?? ""
    }
    
    func willDisplayCell(at index: Int) {
        if viewModel.allowRequestNextPage, index == getNumberOfRows() - 1, viewModel.reviews.count < viewModel.totalElements {
            viewModel.allowRequestNextPage = false
            let prevPage = viewModel.page
            viewModel.page += 1
            getReviewsMovie(appendResult: true) { [weak self] error in
                self?.viewModel.allowRequestNextPage = true
                if error != nil {
                    self?.viewModel.page = prevPage
                }
            }
        }
    }
}
