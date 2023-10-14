//
//  OfflineManager.swift
//  MovieInfoX
//
//  Created by Umer Hamid Khani on 14/10/2023.
//

import Foundation

class OfflineManager {
    // MARK: - Properties
    static let shared = OfflineManager()
    
    private let lastViewedMovieKey = "LastViewedMovie"
    
    // MARK: - Public Methods
    func saveLastViewedMovieDetails(movieDetail: MovieDetail) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(movieDetail)
            UserDefaults.standard.set(data, forKey: lastViewedMovieKey)
        } catch {
//            print("Error saving last viewed movie details: \(error.localizedDescription)")
        }
    }

    func getLastViewedMovieDetailsInString() -> String {
        let movieDetail: MovieDetail = getLastViewedMovieDetails() ?? MovieDetail()
        return """
               Title: \(String(describing: movieDetail.title ?? "N/A"))
               
               Overview: \(String(describing: movieDetail.overview ?? "N/A"))
               
               Release Date: \(String(describing: movieDetail.releaseDate ?? "N/A"))
               
               Popularity: \(String(describing: movieDetail.popularity ?? 0.0))
               
               Tagline: \(String(describing: movieDetail.tagline ?? "N/A"))
               
               Homepage: \(String(describing: movieDetail.homepage ?? "N/A"))
               
               IMDb ID: \(String(describing: movieDetail.imdbId  ?? "N/A"))
               
               Original Language: \(String(describing: movieDetail.originalLanguage ?? "N/A"))
               
               Runtime: \(String(describing: movieDetail.runtime ?? 0))
               
               Status: \(String(describing: movieDetail.status ?? "N/A"))
               
               Belongs to Collection: \(String(describing: movieDetail.belongsToCollection?.name  ?? "N/A"))
               
               Budget: \(String(describing: movieDetail.budget ?? 0))
               
               Revenue: \(String(describing: movieDetail.revenue ?? 0))
               
               Adult: \(String(describing: movieDetail.adult ?? false))
               
               Video: \(String(describing: movieDetail.video ?? false))
               
               Vote Average: \(String(describing: movieDetail.voteAverage ?? 0))
               
               Vote Count: \(String(describing: movieDetail.voteCount ?? 0))
               
               Genres: \(String(describing: movieDetail.genres.map { $0 }))
               
               Production Companies: \(String(describing: movieDetail.productionCompanies.map { $0 }))
               
               Spoken Languages: \(String(describing: movieDetail.spokenLanguages.map { $0 }))
               
               """
    }
    
    // MARK: - Private Methods
    private func getLastViewedMovieDetails() -> MovieDetail? {
        if let data = UserDefaults.standard.data(forKey: lastViewedMovieKey) {
            do {
                let decoder = JSONDecoder()
                let movie = try decoder.decode(MovieDetail.self, from: data)
                return movie
            } catch {
//                print("Error retrieving last viewed movie details: \(error.localizedDescription)")
            }
        }
        return nil
    }
}
