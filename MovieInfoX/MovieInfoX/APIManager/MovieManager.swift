//
//  MovieManager.swift
//  MovieInfoX
//
//  Created by Umer Hamid Khani on 13/10/2023.
//

import Foundation

class MovieManager {
    // MARK: - Properties
    let movieAPI = MovieAPI()

    // MARK: - Public Methods
    func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
        movieAPI.fetchPopularMovies { movies in
            completion(movies)
        }
    }

    func fetchMovieDetails(movieId: Int, completion: @escaping (MovieDetail?) -> Void) {
        movieAPI.fetchMovieDetails(movieId: movieId) { movieDetail in
            if let movie = movieDetail {
                OfflineManager.shared.saveLastViewedMovieDetails(movieDetail: movie)
            }
            completion(movieDetail)
        }
    }
}
