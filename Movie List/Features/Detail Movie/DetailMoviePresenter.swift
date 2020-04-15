//
//  DetailMoviePresenter.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class DetailMoviePresenter: IDetailMoviePresenter {
    weak var view: IDetailMovieView?
    let viewModel: DetailMovieViewModel
    let interactor: IDetailMovieInteractor
    let wireframe: IDetailMovieWireframe
    
    init(viewModel: DetailMovieViewModel, interactor: IDetailMovieInteractor, wireframe: IDetailMovieWireframe) {
        self.viewModel = viewModel
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func setView(_ view: IDetailMovieView) {
        self.view = view
    }
    
    func viewWillAppear() {
        getDetailMovie()
    }
    
    private func getDetailMovie() {
        view?.showLoading(true)
        interactor.getDetailMovie(movieId: viewModel.movieId) { [weak self] data, type in
            self?.view?.showLoading(false)
            if let data = data {
                self?.viewModel.detailMovie = data
                self?.view?.reloadView()
            }
            if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getDetailMovie()
                })
            }
        }
    }
    
    func getTitlePage() -> String {
        return ""
    }
    
    func getImageURL() -> URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.detailMovie.posterPath ?? "")")
    }
    
    func getTitleMovie() -> String {
        return viewModel.detailMovie.title ?? ""
    }
    
    func getRate() -> String {
        return "\(viewModel.detailMovie.voteAverage ?? 0) (\(viewModel.detailMovie.voteCount ?? 0))"
    }
    
    func getGenre() -> String {
        guard let genres = viewModel.detailMovie.genres
            else { return "" }
        return genres.map({ $0.name ?? "" }).joined(separator: ", ")
    }
    
    func getOverview() -> String {
        return viewModel.detailMovie.overview ?? ""
    }
    
    func getReleaseDate() -> String {
        return viewModel.detailMovie.releaseDate ?? ""
    }
    
    func didSelectReviews() {
        wireframe.navigateToListReviews(with: viewModel.movieId)
    }
}
