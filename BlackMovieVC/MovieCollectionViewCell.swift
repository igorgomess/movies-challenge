//
//  MovieCollectionViewCell.swift
//  BlackMovieVC
//
//  Created by Igor Gomes on 11/08/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let idenfier:String = "MovieCollectionViewCell"
    

    let nameMovie: UILabel = {
        let labelMovie = UILabel()
        labelMovie.text = "Homem-Aranha"
        labelMovie.textColor = .black
        labelMovie.font = UIFont.systemFont(ofSize: 18)
        return labelMovie
    }()

}
