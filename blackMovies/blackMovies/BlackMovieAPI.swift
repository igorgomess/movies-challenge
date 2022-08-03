//
//  BlackMovieAPI.swift
//  blackMovies
//
//  Created by Igor Gomes on 18/07/22.
//

import Foundation

class BlackMovieAPI {

    static func makeRequest (completion: @escaping (ResponseMovie) -> Void) {
        guard let url =
        URL(string:
                "https://api.themoviedb.org/3/movie/popular?api_key=5f8f1412c293dc5178cd7de381ef1459")
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
                let movie = try JSONDecoder().decode(ResponseMovie.self, from: data)
                
                DispatchQueue.main.async { completion(movie) }

            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }

    static func makeRequestDetailsMovie (idMovies: Int, completionDetails: @escaping (ResponseDetails) -> Void) {
        guard let url =
        URL(string:
                "https://api.themoviedb.org/3/movie/\(idMovies)?api_key=5f8f1412c293dc5178cd7de381ef1459")
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
                print(actorsMovie)
                DispatchQueue.main.async { completionActors(actorsMovie) }
            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
