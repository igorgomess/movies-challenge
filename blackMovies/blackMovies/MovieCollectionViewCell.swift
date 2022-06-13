//
//  MovieCollectionViewCell.swift
//  blackMovies
//
//  Created by Igor Gomes on 08/06/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var movieImagePopular: UIImageView!
    @IBOutlet weak var movieDatePopular: UILabel!
    @IBOutlet weak var movieNamePopular: UILabel!

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    func setup(with movie: Movie){
        movieImageView.image = movie.image
        movieName.text = movie.title
        dateMovie.text = movie.dateMovie
    }
    func set(with movie: Movie){
        movieImagePopular.image = movie.image
        movieNamePopular.text = movie.title
        movieDatePopular.text = movie.dateMovie
    }
}
