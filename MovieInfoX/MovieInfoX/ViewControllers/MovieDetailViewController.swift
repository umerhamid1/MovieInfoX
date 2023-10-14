//
//  MovieDetailViewController.swift
//  MovieInfoX
//
//  Created by Umer Hamid Khani on 13/10/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {

    // MARK: - Properties
    var movie: Movie? // Populate this with the selected movie

    // MARK: - Outlets
    @IBOutlet weak var responseTextView: UITextView! // Add more outlets as needed

    // MARK: - Variables
    let movieManager = MovieManager()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Movie Detail"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        IHProgressHUD.show(withStatus: "Loading, Please wait..")
        if let movieId = movie?.id {
            movieManager.fetchMovieDetails(movieId: movieId) { [weak self] movieDetail in
                if let movieDetail = movieDetail {
                    DispatchQueue.main.async {
                        self?.updateUI(with: movieDetail)
                    }
                    IHProgressHUD.dismiss()
                }
            }
        }
    }

    // MARK: - Helper Functions
    func updateUI(with movieDetail: MovieDetail) {
        responseTextView.text = formatedMovieDetailsInString(with: movieDetail)
    }
    
    func formatedMovieDetailsInString(with movieDetail: MovieDetail) -> String {

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
}

