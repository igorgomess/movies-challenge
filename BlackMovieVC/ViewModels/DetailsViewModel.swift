class DetailsViewModel {
    
    private let service = MovieService()
    weak var detailsViewController: DetailsViewController?
    weak var viewController: ViewController?

    func fetchActor() {
        guard let idMovie = viewController?.movieClickedIndex else { return }
        
        let endpoint = Endpoint.requestActors(idMovie: idMovie)
        MovieService.makeRequest(endpoint: endpoint ) { (result: Result<ResponseActorsMovie,Error>) in
            switch result {
            case .success(let actors):
                self.detailsViewController?.displayMovie(actors:actors.cast)
            case .failure(let error):
                self.detailsViewController?.showError(error: error)
            }
        }
    }

    func fetchMovie() {
        guard let idMovie = viewController?.movieClickedIndex else { return }

        let endpoint = Endpoint.requestMovieDetails(idMovie: idMovie)
        MovieService.makeRequest(endpoint: endpoint ) { (result: Result<ResponseDetailsMovie,Error>) in
            switch result {
            case .success(let detailsMovie):
                self.detailsViewController?.displayMovie(actors: detailsMovie.)
            case .failure(let error):
                self.detailsViewController?.showError(error: error)
            }
        }
    }
}
