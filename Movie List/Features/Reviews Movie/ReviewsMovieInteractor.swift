//
//  ReviewsMovieInteractor.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class ReviewsMovieInteractor: IReviewsMovieInteractor {
    let request: IRequest
    
    init(request: IRequest) {
        self.request = request
    }
    
    func getReviewsMovie(page: Int, id: Int, completion: @escaping ((ReviewsModel?, ErrorType?) -> Void)) {
        request.call(.getReviews(id: id, page: page), bodyParams: [:]) { data, type in
            if let reviewModel = ReviewsModel.decode(from: data) {
                completion(reviewModel, nil)
            }else{
                completion(nil, type)
            }
        }
    }
}
