//
//  ListMoviePresenter.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class ListMoviePresenter: IListMoviePresenter {
    weak var view: IListMovieView?
    let viewModel: ListMovieViewModel
    let interactor: IListMovieInteractor
    let wireframe: IListMovieWireframe
    
    init(viewModel: ListMovieViewModel, interactor: IListMovieInteractor, wireframe: IListMovieWireframe) {
        self.viewModel = viewModel
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func setView(_ view: IListMovieView) {
        self.view = view
    }
    
    func viewWillAppear() {
        getListMovie()
    }
    
    private func getListMovie(appendResult: Bool = false, completion: ((ErrorType?) -> Void)? = nil) {
        view?.showLoading(true)
        interactor.getListMovie(page: viewModel.page, genreId: viewModel.genreId) { [weak self] data, type in
            self?.view?.showLoading(false)
            if let data = data {
                self?.viewModel.totalPages = data.totalPages ?? 0
                self?.viewModel.totalElements = data.totalResults ?? 0
                if appendResult {
                    self?.viewModel.movies.append(contentsOf: data.results)
                } else {
                    self?.viewModel.movies = data.results
                }
                self?.view?.reloadView()
            }
            if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getListMovie(appendResult: appendResult)
                })
            }
            completion?(type)
        }
    }
    
    func getTitlePage() -> String {
        return "\(viewModel.genreName) Movies"
    }
    
    func getNumberOfRows() -> Int {
        return viewModel.movies.count
    }
    
    func getImageURL(at index: Int) -> URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.movies[index].backdropPath ?? "")")
    }
    
    func getTitleMovie(at index: Int) -> String {
        return viewModel.movies[index].title ?? ""
    }
    
    func getRate(at index: Int) -> Double {
        return viewModel.movies[index].voteAverage ?? 0
    }
    
    func getOverview(at index: Int) -> String {
        return viewModel.movies[index].overview ?? ""
    }
    
    func willDisplayCell(at index: Int) {
        if viewModel.allowRequestNextPage, index == getNumberOfRows() - 1, viewModel.movies.count < viewModel.totalElements {
            viewModel.allowRequestNextPage = false
            let prevPage = viewModel.page
            viewModel.page += 1
            getListMovie(appendResult: true) { [weak self] error in
                self?.viewModel.allowRequestNextPage = true
                if error != nil {
                    self?.viewModel.page = prevPage
                }
            }
        }
    }
    
    func didSelectMovie(at index: Int) {
        wireframe.navigateToDetailMovie(with: viewModel.movies[index].id ?? 0)
    }
}
