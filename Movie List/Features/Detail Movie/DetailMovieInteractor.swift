//
//  DetailMovieInteractor.swift
//  Movie List
//
//  Created by Verrelio C. Rizky on 15/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class DetailMovieInteractor: IDetailMovieInteractor {
    let request: IRequest
    
    init(request: IRequest) {
        self.request = request
    }
    
    func getDetailMovie(movieId: Int, completion: @escaping ((DetailMovieModel?, ErrorType?) -> Void)) {
        request.call(.getDetailMovie(id: movieId), bodyParams: [:]) { data, type in
            if let detailModel = DetailMovieModel.decode(from: data) {
                completion(detailModel, nil)
            }else{
                completion(nil, type)
            }
        }
    }
    
    func getYoutubeVideo(movieId: Int, completion: @escaping (([VideosModelResults]?, ErrorType?) -> Void)) {
        request.call(.getVideo(id: movieId), bodyParams: [:]) { data, type in
            if let videoModel = VideosModel.decode(from: data) {
                completion(videoModel.results, nil)
            }else{
                completion(nil, type)
            }
        }
    }
}
