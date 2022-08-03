//
//  DetailsViewController.swift
//  blackMovies
//
//  Created by Igor Gomes on 21/06/22.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var synopsisMovie: UILabel!

    var movie: Movie?
    var indexMovies: Int!
    var actorsMovie: [ActorsMovie]? = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        BlackMovieAPI.makeRequestDetailsMovie(idMovies: indexMovies, completionDetails: { responseDetails in
            guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(responseDetails.backDropPath)")
            else { return }
            self.imageMovie.setImage(url: url)
            self.nameMovie.text = responseDetails.originalTitle
            self.yearMovie.text = responseDetails.releaseDate
            self.descriptionMovie.text = responseDetails.tagline
            self.synopsisMovie.text = responseDetails.overview

        })

        BlackMovieAPI.makeRequestActorsMovie(idMovies: indexMovies) { responseActors in
            print(responseActors)
            self.actorsMovie = responseActors.cast
            self.collectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let actorsMovie = actorsMovie else { return 0 }
        return actorsMovie.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let actorsMovie = actorsMovie, let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCollectionViewCellActors", for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Cell not found")
        }
        cell.actorMovie(with: actorsMovie[indexPath.row])
        return cell
    }
}
