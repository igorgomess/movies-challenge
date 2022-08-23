//
//  MovieViewModel.swift
//  blackMovies
//
//  Created by Igor Gomes on 15/08/22.
//

import UIKit

class MovieViewModel {
    weak var viewController: MovieViewController?
    var pageIndex = 1
    func featchMovie() {
        MovieService.makeRequest(page: pageIndex ) { result in
            switch result {
            case .success(let responseMovie):
                self.viewController?.display(movies: responseMovie.results)
            case .failure(let error):
                print(error)
            }

        }
    }
    func appendMovie() {
            pageIndex += 1
            print(pageIndex)
            MovieService.makeRequest(page: pageIndex) { result in
                switch result {
                case .success(let responseMovie):
                    self.viewController?.movies.append(contentsOf: responseMovie.results)
                case .failure(let error):
                    print(error)
                }

            }
    }
}
