//
//  DescriptionMovieCollectionViewCell.swift
//  blackMovies
//
//  Created by Igor Gomes on 17/06/22.
//

import UIKit

class DescriptionMovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameActor: UILabel!
    @IBOutlet weak var imageActor: UIImageView!

    func setupp(with detailsMovies: DetailsMovies){
        imageActor.image = detailsMovies.imageActor
        nameActor.text = detailsMovies.nameActor

    }
}
