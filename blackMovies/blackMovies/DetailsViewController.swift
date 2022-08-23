//
//  DetailsViewController.swift
//  blackMovies
//
//  Created by Igor Gomes on 21/06/22.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDataSource {
    let detailsViewModel = DetailsViewModel()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var synopsisMovie: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewModel.detailsViewController = self
        collectionView.dataSource = self
        detailsViewModel.makeActorsMovie()
        detailsViewModel.makeDetailsMovie()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let actorsMovie = detailsViewModel.actorsMovie
        else { return 0 }
        return actorsMovie.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let actorsMovie = detailsViewModel.actorsMovie, let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCollectionViewCellActors", for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Cell not found")
        }
        cell.actorMovie(with: actorsMovie[indexPath.row])
        print(cell)
        return cell
    }
}
