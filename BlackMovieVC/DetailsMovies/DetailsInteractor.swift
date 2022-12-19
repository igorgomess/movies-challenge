//
//  DetailsInteractor.swift
//  BlackMovieVC
//
//  Created by Igor Gomes  on 13/10/22.
//

import UIKit

class DetailsInteractor {
    private let service: MovieService
    private let presenter: DetailsPresenter
    
    init(service: MovieService, presenter: DetailsPresenter) {
        self.service = service
        self.presenter = presenter
    }
    
    func fetchActor(idMovie: Int) {
        let endpoint = Endpoint.requestActors(idMovie: idMovie)
        MovieService.makeRequest(endpoint: endpoint ) { (result: Result<ResponseActorsMovie,Error>) in
            switch result {
            case .success(let actors):
                self.presenter.show(actors: actors.cast)
            case .failure(let error):
                self.presenter.show(error: error)
            
            }
        }
    }

    func fetchDetailsMovie(idMovie: Int) {
        let endpoint = Endpoint.requestMovieDetails(idMovie: idMovie)
        MovieService.makeRequest(endpoint: endpoint ) { (result: Result<ResponseDetailsMovie,Error>) in
            switch result {
            case .success(let details):
                self.presenter.show(detailsMovie: details)
            case .failure(let error):
                self.presenter.show(error: error)
            }
        }
    }
}
