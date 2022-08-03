//
//  MovieCollectionViewCell.swift
//  blackMovies
//
//  Created by Igor Gomes on 08/06/22.
//

import UIKit

extension UIImageView {
    func setImage(url: URL?) {
        DispatchQueue.global().async { [weak self] in
            guard let url = url, let data = try? Data(contentsOf: url) else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            self?.setImage(image)
        }
    }
    func setImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    func setup(with movie: Movie) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        else { return }
        movieImageView.setImage(url: url)
        movieName.text = movie.title
        dateMovie.text = movie.releaseDate
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }
    func actorMovie (with movie: ActorsMovie) {
        movieName.text = movie.name
        dateMovie.text = movie.character
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.profilePath)")
        else { return }
        movieImageView.setImage(url: url)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        tagView.layer.borderWidth = 1
        tagView.layer.borderColor = UIColor.white.cgColor
    }
}
