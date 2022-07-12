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
    let details: [MoviesDetails]
    let actors: [Actor]

internal init(title: String, dateMovie: String, image: UIImage, details: [MoviesDetails] = [], actors: [Actor] = []) {
        self.title = title
        self.dateMovie = dateMovie
        self.image = image
        self.details = details
        self.actors = actors
    }

}
struct Actor {
    let name: String
    let image: UIImage
    let nameFigure: String
}
struct MoviesDetails {
    let synopsis: String
    let description: String
}

let moviesUpcomig: [Movie] = [
    Movie(title: "Flash", dateMovie: "1997", image: #imageLiteral(resourceName: "flash"), details: details, actors: actors),
    Movie(title: "The Walking Dead", dateMovie: "2019", image: #imageLiteral(resourceName: "thewalkingdead"), details: details, actors: actors),
    Movie(title: "Homem-Aranha", dateMovie: "2021", image: #imageLiteral(resourceName: "homemaranha"), details: details, actors: actors),
    Movie(title: "Hotel transilvânia 4", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "HotelTransylvania"), details: details, actors: actors),
    Movie(title: "Encanto", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "encanto"), details: details, actors: actors),
    Movie(title: "Game Of Thrones", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "got"), details: details, actors: actors),
    Movie(title: "Halo", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "halo"), details: details, actors: actors),
    Movie(title: "Startrek", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "startrek"), details: details, actors: actors),
    Movie(title: "Uncharted", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "uncharted"), details: details, actors: actors),
    Movie(title: "Greys Anatomy", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "greysanatomy"), details: details, actors: actors),
    Movie(title: "Morbius", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "morbius"), details: details, actors: actors),
    Movie(title: "Turning Red", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "turninred"), details: details, actors: actors)
]

let moviesPopular: [Movie] = [
    Movie(title: "Peaky Blinders", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "peakyblinders"), details: details, actors: actors),
    Movie(title: "Stranger Things", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "strangerthings"), details: details, actors: actors),
    Movie(title: "Ms. Marvel", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "msmarvel"), details: details, actors: actors),
    Movie(title: "Prehistoric Planet", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "prehistoricplanet"), details: details, actors: actors),
    Movie(title: "Doctor Strange", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "doctorstrange"), details: details, actors: actors),
    Movie(title: "This Is Us", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "thisisus"), details: details, actors: actors),
    Movie(title: "The Expendables 2", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "theexpendables"), details: details, actors: actors),
    Movie(title: "The Boys", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "theboys"), details: details, actors: actors),
    Movie(title: "Squid Game", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "squidgame"), details: details, actors: actors)
]

let actors = [
    Actor(name: "Tom Holland", image: #imageLiteral(resourceName: "bBRlrpJm9XkNSg0YT5LCaxqoFMX"), nameFigure: "Peter Parker/Spider Man"),
    Actor(name: "Zendaya", image: #imageLiteral(resourceName: "6TE2AlOUqcrs7CyJiWYgodmee1r"), nameFigure: "Michelle 'MJ'Jones"),
    Actor(name: "Benedict Cumberbatch", image: #imageLiteral(resourceName: "fBEucxECxGLKVHBznO0qHtCGiMO"), nameFigure: "Stephen Strange / Doctor Strange"),
    Actor(name: "Jacob Batalon", image: #imageLiteral(resourceName: "53YhaL4xw4Sb1ssoHkeSSBaO29c"), nameFigure: "Ned Leeds"),
    Actor(name: "Jon Favreau", image: #imageLiteral(resourceName: "8MtRRnEHaBSw8Ztdl8saXiw1egP"), nameFigure: "Harold 'Happy' Hogan"),
    Actor(name: "Benedict Wong", image: #imageLiteral(resourceName: "wong2"), nameFigure: "Wong"),
    Actor(name: "Alfred Molina", image: #imageLiteral(resourceName: "nJo91Czesn6z0d0pkfbDoVZY3sg"), nameFigure: "Dr. Otto Octavius / Doctor Octopus"),
    Actor(name: "Willem Dafoe", image: #imageLiteral(resourceName: "ui8e4sgZAwMPi3hzEO53jyBJF9B"), nameFigure: "Norman Osborn / Green Goblin"),
    Actor(name: "Jamie Foxx", image: #imageLiteral(resourceName: "hPwCMEq6jLAidsXAX5BfoYgIfg2"), nameFigure: "Max Dillon / Electro")
]

let details = [
MoviesDetails(synopsis: """
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in
a piece of classical Latin literature from 45 BC, making it over 2000 years old.
Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,
looked up one of the more obscure Latin words, consectetur,
from a Lorem Ipsum passage, and going through the cites of the word in classical
 literature, discovered the undoubtable source.
Lorem Ipsum comes from sections
1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\"
(The Extremes of Good and Evil) by Cicero, written in 45 BC.
This book is a treatise on the theory of ethics, very popular during the Renaissance.
The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\",
comes from a line in section 1.10.32.
""", description: "teste"),
    MoviesDetails(synopsis: "Stranger Things", description: "teste"),
MoviesDetails(synopsis: "Em Homem-Aranha", description: "teste")
]
