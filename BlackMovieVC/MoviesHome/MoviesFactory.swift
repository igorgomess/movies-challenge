//
//  MoviesFactory.swift
//  BlackMovieVC
//
//  Created by Igor Gomes  on 04/10/22.
//

import Foundation

enum HomeFactory {
    static func make() -> ViewController {
        let presenter = MoviesPresenter()
        let service = MovieService()
        let interactor = MoviesInteractor(service: service, presenter: presenter)
        let viewController = ViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
