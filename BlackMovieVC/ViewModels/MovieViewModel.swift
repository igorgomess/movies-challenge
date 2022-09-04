class MovieViewModel {
    
    private let service = MovieService()
    weak var viewController: ViewController?
    var pageIndex = 0

    func fetchMovie() {
        pageIndex += 1
        let endpoint = Endpoint.requestMovies(pageIndex: pageIndex)

        MovieService.makeRequest(endpoint: endpoint) { (result: Result<ResponseMovies,Error>) in
            switch result {
            case .success(let movies):
                self.viewController?.displayMovie(movies: movies.results)

            case .failure(let error):
                self.viewController?.showError(error: error)
            }
        }
    }
}
