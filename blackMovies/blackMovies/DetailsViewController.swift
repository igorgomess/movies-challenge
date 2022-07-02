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
    var indexMovies: Int?






    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageMovie.image = movie?.image
        nameMovie.text = movie?.title
        yearMovie.text = movie?.dateMovie
        descriptionMovie.text = movie?.details[indexMovies!].description
        synopsisMovie.text = movie?.details[indexMovies!].synopsis
        collectionView.dataSource = self



    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movie = movie else { return 0 }
        return movie.actors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let movie = movie, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell2", for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Cell not found")
        }

        cell.actorsMovie(with: movie.actors[indexPath.row])
        return cell
    }

}

