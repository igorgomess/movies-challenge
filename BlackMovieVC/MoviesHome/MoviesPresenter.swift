//
//  MoviesPresenter.swift
//  BlackMovieVC
//
//  Created by Igor Gomes  on 04/10/22.
//

import UIKit

class MoviesPresenter {
    weak var viewController: ViewController?
    
    func show(movies: [Movies]) {
        viewController?.display(movies: movies)
    }
    func show(error: Error) {
        viewController?.show(error: error.localizedDescription)
    }
}

