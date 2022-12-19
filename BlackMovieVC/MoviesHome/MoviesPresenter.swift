import UIKit

protocol MoviesPresentationLogic {
    func show(movies: [Movies])
    func show(error: Error)
}

class MoviesPresenter: MoviesPresentationLogic {
    weak var viewController: ViewController?
    let coordinator: MoviesCoordinatorLogic
    
    init(coordinator: MoviesCoordinatorLogic) {
        self.coordinator = coordinator
    }
    
    func show(movies: [Movies]) {
        viewController?.display(movies: movies)
    }
    
    func show(error: Error) {
        viewController?.show(error: error.localizedDescription)
    }
}

