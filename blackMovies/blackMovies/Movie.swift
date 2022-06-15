//
//  Movie.swift
//  blackMovies
//
//  Created by Igor Gomes on 07/06/22.
//

import UIKit

struct Movie {
    let title: String
    let dateMovie: String
    let image: UIImage

}

let moviesUpcomig: [Movie] = [
    Movie(title: "Flash", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "flash")),
    Movie(title: "The Walking Dead", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "thewalkingdead")),
    Movie(title: "Homem-Aranha", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "homemaranha")),
    Movie(title: "Hotel transilvânia 4", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "HotelTransylvania")),
    Movie(title: "Encanto", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "encanto")),
    Movie(title: "Game Of Thrones", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "got")),
    Movie(title: "Halo", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "halo")),
    Movie(title: "Startrek", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "startrek")),
    Movie(title: "Uncharted", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "uncharted")),
    Movie(title: "Greys Anatomy", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "greysanatomy")),
    Movie(title: "Morbius", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "morbius")),
    Movie(title: "Turning Red", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "turninred"))
]

let moviesPopular: [Movie] = [
    Movie(title: "Peaky Blinders", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "peakyblinders")),
    Movie(title: "Stranger Things", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "strangerthings")),
    Movie(title: "Ms. Marvel", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "msmarvel")),
    Movie(title: "Prehistoric Planet", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "prehistoricplanet")),
    Movie(title: "Doctor Strange", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "doctorstrange")),
    Movie(title: "This Is Us", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "thisisus")),
    Movie(title: "The Expendables 2", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "theexpendables")),
    Movie(title: "The Boys", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "theboys")),
    Movie(title: "Squid Game", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "squidgame"))
]
