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

    internal init(title: String, dateMovie: String, image: UIImage, details: [MoviesDetails] = [],actors: [Actor] = []) {
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
    let description:String
}


let moviesUpcomig: [Movie] = [
    Movie(title: "Flash", dateMovie: "1997", image: #imageLiteral(resourceName: "flash"), details: details, actors:actors),
    Movie(title: "The Walking Dead",dateMovie: "2019",image: #imageLiteral(resourceName: "thewalkingdead"), details: details, actors:actors),
    Movie(title: "Homem-Aranha", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "homemaranha"), details: details, actors:actors),
    Movie(title: "Hotel transilvânia 4", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "HotelTransylvania"), details: details, actors:actors),
    Movie(title: "Encanto", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "encanto"), details: details, actors:actors),
    Movie(title: "Game Of Thrones", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "got"), details: details, actors:actors),
    Movie(title: "Halo", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "halo"), details: details, actors:actors),
    Movie(title: "Startrek", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "startrek"), details: details, actors:actors),
    Movie(title: "Uncharted", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "uncharted"), details: details, actors:actors),
    Movie(title: "Greys Anatomy", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "greysanatomy"), details: details, actors:actors),
    Movie(title: "Morbius", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "morbius"), details: details, actors:actors),
    Movie(title: "Turning Red", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "turninred"), details: details, actors:actors)
]

let moviesPopular: [Movie] = [
    Movie(title: "Peaky Blinders", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "peakyblinders"), details: details, actors:actors),
    Movie(title: "Stranger Things", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "strangerthings"), details: details, actors:actors),
    Movie(title: "Ms. Marvel", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "msmarvel"),details: details, actors:actors),
    Movie(title: "Prehistoric Planet", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "prehistoricplanet"), details: details, actors:actors),
    Movie(title: "Doctor Strange", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "doctorstrange"), details: details, actors:actors),
    Movie(title: "This Is Us", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "thisisus"), details: details, actors:actors),
    Movie(title: "The Expendables 2", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "theexpendables"), details: details, actors:actors),
    Movie(title: "The Boys", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "theboys"), details: details, actors:actors),
    Movie(title: "Squid Game", dateMovie: "17/04/22", image: #imageLiteral(resourceName: "squidgame"), details: details, actors:actors)
]


let actors = [
    Actor(name: "Peaky Blinders", image: #imageLiteral(resourceName: "peakyblinders"), nameFigure: "teste"),
    Actor(name: "Stranger Things", image: #imageLiteral(resourceName: "strangerthings"), nameFigure: "teste"),
    Actor(name: "Ms. Marvel", image: #imageLiteral(resourceName: "msmarvel"), nameFigure: "teste")
]

let details = [
    MoviesDetails(synopsis: "O investigador forense Barry Allen (Grant Gustin) sofre um acidente em seu laboratório: ele leva um banho de produtos químicos e, em seguida, é atingido por um raio. A partir disso, ele se torna capaz de canalizar os poderes do Campo de Velocidade e de se locomover com uma rapidez sobre-humana. De máscara e uniforme vermelhos, Barry assume a identidade do super-herói Flash e começa a usar suas habilidades para patrulhar Central City, contando com a ajuda dos cientistas da S.T.A.R. Labs. Ao mesmo tempo que detém vilões, ele procura descobrir quem está por trás do assassino de sua mãe.", description: "A boy falls in love with a horse named Flash that's for sale. He gets a job to earn the money to buy the horse, but he's forced to sell when the family falls upon hard times."),
    MoviesDetails(synopsis: "Stranger Things", description: "teste"),
    MoviesDetails(synopsis: "Ms. Marvel", description: "teste")
]



