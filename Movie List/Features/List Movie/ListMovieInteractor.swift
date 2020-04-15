//
//  ListMovieInteractor.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ListMovieInteractor: IListMovieInteractor {
    let request: IRequest
    
    init(request: IRequest) {
        self.request = request
    }
    
    func getListMovie(page: Int, genreId: Int, completion: @escaping ((ListMovieModel?, ErrorType?) -> Void)) {
        request.call(.getDiscoverMovie(page: page, genreId: genreId), bodyParams: [:]) { data, type in
            if let listModel = ListMovieModel.decode(from: data) {
                completion(listModel, nil)
            }else{
                completion(nil, type)
            }
        }
    }
}
