//
//  DetailsPresenter.swift
//  BlackMovieVC
//
//  Created by Igor Gomes  on 13/10/22.
//

import Foundation

class DetailsPresenter {
    
    weak var detailsViewController: DetailsViewController?
    
    func show(actors: [ActorsMovie]) {
        detailsViewController?.display(actors:actors)
    }
    func show(error: Error) {
        detailsViewController?.show(error: error.localizedDescription)
    }
    
    func show(detailsMovie: ResponseDetailsMovie) {
        detailsViewController?.show(detailsMovie: detailsMovie)
    }
}
