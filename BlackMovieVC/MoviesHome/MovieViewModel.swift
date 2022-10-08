import UIKit

class MovieViewModel {
    
    private let service = MovieService()
    weak var viewController: ViewController?
    private var movies = [Movies]()
    var pageIndex = 0

    func fetchMovie(getPage: Bool) {
        pageIndex += 1
        let endpoint = Endpoint.requestMovies(pageIndex: pageIndex)
        if getPage {
            MovieService.makeRequest(endpoint: endpoint) { (result: Result<ResponseMovies,Error>) in
                switch result {
                case .success(let moviesResponse):
                    self.movies.append(contentsOf: moviesResponse.results)
                    self.viewController?.display(movies: self.movies)
                    
                    
                case .failure(let error):
                    self.viewController?.show(error: error.localizedDescription)
                }
            }
        } else {
            viewController?.display(movies: movies)
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
        viewController?.display(movies: filterMoviesUpcoming)
    }
    
}
