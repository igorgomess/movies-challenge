import UIKit

struct ResponseMovies: Decodable {
    var page = 1
    let results: [Movies]
}

struct Movies: Decodable {
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
}

struct ResponseDetailsMovie: Decodable {
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
    
    func getRealeaseDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"
        
        guard let date = dateFormatterGet.date(from: self.releaseDate) else { return releaseDate }
        let dateString = dateFormatterPrint.string(from: date)
        
        return dateString
    }
}

struct ResponseActorsMovie: Decodable {
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