//
//  MoviesFactory.swift
//  BlackMovieVC
//
//  Created by Igor Gomes  on 04/10/22.
//

import UIKit

enum HomeFactory {
    static func make() -> ViewController {
        let coordinator = MoviesCoordinator(idMovie: 1123)
        let presenter = MoviesPresenter(coordinator: coordinator)
        let service = MovieService()
        let interactor = MoviesInteractor(service: service, presenter: presenter)
        let viewController = ViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
