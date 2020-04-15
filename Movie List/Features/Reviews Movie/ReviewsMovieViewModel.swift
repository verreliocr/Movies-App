//
//  ReviewsMovieViewModel.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ReviewsMovieViewModel {
    var movieId: Int
    var page: Int = 1
    var totalPages: Int = 0
    var totalElements: Int = 0
    var allowRequestNextPage: Bool = true
    var reviews: [ReviewsModelResults] = []
    
    init(movieId: Int) {
        self.movieId = movieId
    }
}
