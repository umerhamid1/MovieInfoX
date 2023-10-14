//
//  MovieAPI.swift
//  MovieInfoX
//
//  Created by Umer Hamid Khani on 13/10/2023.
//

import Foundation
import UIKit


struct MovieResponse: Decodable {
    let results: [Movie]
}


class MovieAPI {
    // MARK: - Properties
    let apiKey = "556f790f3c419d25cb1ea04caf6f00b4"
    let baseURL = "https://api.themoviedb.org/3"

    // MARK: - Fetch Popular Movies
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error appropriately
                print("Error fetching popular movies: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                completion(movieResponse.results)
            } catch {
                // Handle the decoding error appropriately
                print("Error decoding popular movies: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }

    // MARK: - Fetch Movie Details
    func fetchMovieDetails(movieId: Int, completion: @escaping (MovieDetail?) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error appropriately
                print("Error fetching movie details: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let movie = try decoder.decode(MovieDetail.self, from: data)
                completion(movie)
            } catch {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Error Received data: \(dataString)")
                }

                // Handle the decoding error appropriately
                print("Error decoding movie details: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}


