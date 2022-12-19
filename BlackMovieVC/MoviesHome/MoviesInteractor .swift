import UIKit

protocol MoviesBusinessLogic {
    func fetchMovie(getPage: Bool)
    func getMoviesFilter()
}


final class MoviesInteractor: MoviesBusinessLogic {
     private let service: MovieService
     private let presenter: MoviesPresentationLogic
    
    init(service: MovieService, presenter: MoviesPresentationLogic) {
        self.service = service
        self.presenter = presenter
    }
    
    private var movies = [Movies]()
    private var pageIndex = 0

    func fetchMovie(getPage: Bool) {
        pageIndex += 1
        let endpoint = Endpoint.requestMovies(pageIndex: pageIndex)
        if getPage {
            MovieService.makeRequest(endpoint: endpoint) { (result: Result<ResponseMovies,Error>) in
                switch result {
                case .success(let moviesResponse):
                    self.movies.append(contentsOf: moviesResponse.results)
                    self.presenter.show(movies: self.movies)
                    
                    
                case .failure(let error):
                    self.presenter.show(error: error)
                }
            }
        } else {
            presenter.show(movies: movies)
        }
    }
    
    func getMoviesFilter() {
        let dateNow = Date()
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        
        let dateString = dateFormatterGet.string(from: dateNow)
        
        let filterMoviesUpcoming = movies.filter({$0.releaseDate > dateString})
        presenter.show(movies: filterMoviesUpcoming)
    }
}