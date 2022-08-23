//
//  BlackMovieAPI.swift
//  blackMovies
//
//  Created by Igor Gomes on 18/07/22.
//

import Foundation

enum Error: Swift.Error {
    case dataNotFound
    case urlError
    case errorNil
    case decodeError
}
class MovieService {

    static func makeRequest (page: Int, completion: @escaping (Result<ResponseMovie,Error>) -> Void) {
        guard let url =
        URL(string:
                "https://api.themoviedb.org/3/movie/popular?api_key=5f8f1412c293dc5178cd7de381ef1459&page=\(page)")
        else {
            print(completion(.failure(.urlError)))
            return

        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                print(completion(.failure(.errorNil)))
                return
            }
            guard let data = data else {
                print(completion(.failure(.dataNotFound)))
                return
            }
            do {
                let movie = try JSONDecoder().decode(ResponseMovie.self, from: data)
                DispatchQueue.main.async { completion(.success(movie)) }

            } catch {
                print(completion(.failure(.decodeError)))
            }
        }.resume()
    }

    static func makeRequestDetailsMovie (idMovies: Int, completionDetails: @escaping (ResponseDetails) -> Void) {
        guard let url =
        URL(string:
                "https://api.themoviedb.org/3/movie/\(idMovies)?api_key=5f8f1412c293dc5178cd7de381ef1459")
        else { return }
        print(idMovies)
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("data error")
                return
            }
            do {
                let movieDetails = try JSONDecoder().decode(ResponseDetails.self, from: data)

                DispatchQueue.main.async { completionDetails(movieDetails) }

            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }

    static func makeRequestActorsMovie (idMovies: Int, completionActors: @escaping (ResponseActors) -> Void) {
        guard let url =
        URL(string:
            "https://api.themoviedb.org/3/movie/\(idMovies)/credits?api_key=5f8f1412c293dc5178cd7de381ef1459")
        else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("data error")
                return
            }
            do {
                let actorsMovie = try JSONDecoder().decode(ResponseActors.self, from: data)
                DispatchQueue.main.async { completionActors(actorsMovie) }
            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }


}
