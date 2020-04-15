//
//  DetailMovieViewModel.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class DetailMovieViewModel {
    var movieId: Int
    var detailMovie: DetailMovieModel = DetailMovieModel()
    var youtubeKey: String = ""
    
    init(movieId: Int) {
        self.movieId = movieId
    }
}
