//
//  ListGenresPresenter.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class ListGenresPresenter: IListGenresPresenter {
    weak var view: IListGenresView?
    let viewModel: ListGenresViewModel
    let interactor: IListGenresInteractor
    let wireframe: IListGenresWireframe
    
    init(viewModel: ListGenresViewModel, interactor: IListGenresInteractor, wireframe: IListGenresWireframe) {
        self.viewModel = viewModel
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func setView(_ view: IListGenresView) {
        self.view = view
    }
    
    func viewWillAppear() {
        getListGenres()
    }
    
    private func getListGenres() {
        view?.showLoading(true)
        interactor.getListGenres { [weak self] data, type in
            self?.view?.showLoading(false)
            if let data = data {
                self?.viewModel.listGenres = data
                self?.view?.reloadView()
            }
            if let type = type {
                self?.view?.handleError(type: type, retryAction: { [weak self] in
                    self?.getListGenres()
                })
            }
        }
    }
    
    func getNumberOfItems() -> Int {
        return viewModel.listGenres.count
    }
    
    func getGenreName(at index: Int) -> String {
        return viewModel.listGenres[index].name ?? ""
    }
    
    func getBackColor(at index: Int) -> UIColor {
        return UIColor.random()
    }
    
    func didSelectGenre(at index: Int) {
        wireframe.navigateToListMovie(with: viewModel.listGenres[index].id ?? 0)
    }
}
