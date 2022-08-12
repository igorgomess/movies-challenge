//
//  Movie.swift
//  blackMovies
//
//  Created by Igor Gomes on 07/06/22.
//

import UIKit

struct ResponseMovie: Decodable {
    var page = 1
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }

    func getRealeaseDate() -> String {
        let dataReversed = releaseDate.split(separator: "-").reversed()
        var realaseDate = String()
        for dataElement in dataReversed {
            realaseDate += "\(dataElement)-"
        }
        let convertDate = realaseDate.trimmingCharacters(in: CharacterSet(charactersIn: "-"))
        return convertDate
    }
}

struct ResponseDetails: Decodable {
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let tagline: String
    let backDropPath: String

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case tagline
        case backDropPath = "backdrop_path"
    }
}

struct ResponseActors: Decodable {
    let cast: [ActorsMovie]
}

struct ActorsMovie: Decodable {
    let name: String
    let profilePath: String?
    let character: String

    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
        case character
    }
}
