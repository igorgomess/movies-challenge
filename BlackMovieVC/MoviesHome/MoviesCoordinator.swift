import UIKit


protocol MoviesCoordinatorLogic {
    func display(movies: [Movies])
}

class MoviesCoordinator: MoviesCoordinatorLogic {
    weak var viewController: ViewController?
    
    let idMovie: Int
    
    init(idMovie: Int) {
        self.idMovie = idMovie
    }
    
    @objc private func showDetailViewController(idMovie: Int) {
        let rootViewController = DetailsViewController(idMovie: idMovie)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        viewController?.show(navigationController, sender: nil)
        
    }
    
    func display(movies: [Movies]) {
        viewController?.display(movies: movies)
    }
}
