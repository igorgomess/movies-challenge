import Foundation

enum ServiceError: Error {
    case urlError
    case dataNotFound
    case decodeError(String)
    case errorNil
}

enum Endpoint {
    case requestMovies(pageIndex: Int)
    case requestMovieDetails(idMovie: Int)
    case requestActors(idMovie: Int)

    private var baseURL: String {
        "https://api.themoviedb.org/3/movie/"
    }

    var fullPath: String {
        let path: String
        switch self {
        case .requestMovies(let pageIndex):
            path = "popular?api_key=5f8f1412c293dc5178cd7de381ef1459&page=\(pageIndex)"
        case .requestMovieDetails(let idMovie):
            path = "\(idMovie)?api_key=5f8f1412c293dc5178cd7de381ef1459"
        case .requestActors(let idMovie):
            path = "\(idMovie)/credits?api_key=5f8f1412c293dc5178cd7de381ef1459"
        }
        return baseURL + path

    }
}

class MovieService {

    static func makeRequest<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(
            string: endpoint.fullPath
        )
        else {
            completion(.failure(ServiceError.urlError))
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data,_,error) in

            if error != nil {
                completion(.failure(ServiceError.errorNil))
                return
            }

            guard let jsonData = data else {
                completion(.failure(ServiceError.dataNotFound))
                return
            }
            do {
                let decoded = try JSONDecoder().decode(T.self, from: jsonData)
                completion(.success(decoded))
            } catch {
                completion(.failure(ServiceError.decodeError(error.localizedDescription)))
            }

        }
        task.resume()
    }

}
