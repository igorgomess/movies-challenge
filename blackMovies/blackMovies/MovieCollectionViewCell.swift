//
//  MovieCollectionViewCell.swift
//  blackMovies
//
//  Created by Igor Gomes on 08/06/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    func setup(with movie: Movie){
        movieImageView.image = movie.image
        movieName.text = movie.title
        dateMovie.text = movie.dateMovie
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        tagView.layer.borderWidth = 1
        tagView.layer.borderColor = UIColor.white.cgColor
    }
}
