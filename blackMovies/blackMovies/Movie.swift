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

let movies: [Movie] = [
    Movie(title: "Flash", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "flash.jpg")),
    Movie(title: "The Walking Dead", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "thewalkingdead")),
    Movie(title: "Homem-Aranha", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "homemaranha")),
    Movie(title: "Hotel transilvânia 4", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "HotelTransylvania")),
    Movie(title: "Marginal", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "marginal")),
    Movie(title: "Game Of Thrones", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "got")),
    Movie(title: "Halo", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "halo")),
    Movie(title: "Startrek", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "startrek")),
    Movie(title: "Uncharted", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "uncharted")),
    Movie(title: "Greys Anatomy", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "greysanatomy")),
]

let moviesPopular: [Movie] = [
    Movie(title: "Flash", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "HotelTransylvania")),
    Movie(title: "The Walking Dead", dateMovie: "17/04/2022", image: #imageLiteral(resourceName: "thewalkingdead")),

]
