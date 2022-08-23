//
//  DetailsViewModel.swift
//  blackMovies
//
//  Created by Igor Gomes on 15/08/22.
//

import UIKit

class DetailsViewModel {
    weak var detailsViewController: DetailsViewController?
    var movie: Movie?
    var indexMovies: Int!
    var actorsMovie: [ActorsMovie]? = []

    func makeDetailsMovie() {
        MovieService.makeRequestDetailsMovie(
            idMovies: indexMovies, completionDetails: {responseDetails in
                guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(responseDetails.backDropPath)")
                else { return }
                self.detailsViewController?.imageMovie.setImage(url: url)
                self.detailsViewController?.nameMovie.text = responseDetails.originalTitle
                self.detailsViewController?.yearMovie.text = responseDetails.releaseDate
                self.detailsViewController?.descriptionMovie.text = responseDetails.tagline
                self.detailsViewController?.synopsisMovie.text = responseDetails.overview

            })
    }
    func makeActorsMovie() {
        guard let indexMovies = indexMovies else { return }
        MovieService.makeRequestActorsMovie(idMovies: indexMovies) { responseActors in
            self.actorsMovie = responseActors.cast
            self.detailsViewController?.collectionView.reloadData()
        }
    }
}
