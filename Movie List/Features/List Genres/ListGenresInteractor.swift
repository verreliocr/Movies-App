//
//  ListGenresInteractor.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ListGenresInteractor: IListGenresInteractor {
    let request: IRequest
    
    init(request: IRequest) {
        self.request = request
    }
    
    func getListGenres(completion: @escaping (([GenreModelItem]?, ErrorType?) -> Void)) {
        request.call(.getListGenre, bodyParams: [:]) { data, type in
            if let genreModel = GenreModel.decode(from: data) {
                completion(genreModel.genres, nil)
            }else{
                completion(nil, type)
            }
        }
    }
}

