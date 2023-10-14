//
//  OfflineViewController.swift
//  MovieInfoX
//
//  Created by Umer Hamid Khani on 13/10/2023.
//

import UIKit

class OfflineViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var lastSearchTextView: UITextView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        configureNavigationBar()
        updateLastSearchedMovieDetails()
    }

    // MARK: - Private Methods
    private func configureNavigationBar() {
        self.navigationItem.title = "Last Searched Movie"
    }

    private func updateLastSearchedMovieDetails() {
        lastSearchTextView.text = OfflineManager.shared.getLastViewedMovieDetailsInString()
    }
}

