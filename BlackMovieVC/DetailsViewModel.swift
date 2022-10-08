class DetailsViewModel {
    
    private let service = MovieService()
    weak var detailsViewController: DetailsViewController?

    func fetchActor(idMovie: Int) {
        let endpoint = Endpoint.requestActors(idMovie: idMovie)
        MovieService.makeRequest(endpoint: endpoint ) { (result: Result<ResponseActorsMovie,Error>) in
            switch result {
            case .success(let actors):
                self.detailsViewController?.displayActorsMovie(actors:actors.cast)
            case .failure(let error):
                self.detailsViewController?.showError(error: error)
            }
        }
    }

    func fetchDetailsMovie(idMovie: Int) {
        let endpoint = Endpoint.requestMovieDetails(idMovie: idMovie)
        MovieService.makeRequest(endpoint: endpoint ) { (result: Result<ResponseDetailsMovie,Error>) in
            switch result {
            case .success(let details):
                self.detailsViewController?.showDetailsMovie(detailsMovie: details)
            case .failure(let error):
                self.detailsViewController?.showError(error: error)
            }
        }
    }
}
