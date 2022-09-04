//
//  MovieCollectionViewCell.swift
//  BlackMovieVC
//
//  Created by Igor Gomes on 11/08/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let idenfier: String = "MovieCollectionViewCell"
    
    let imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let nameMovie: UILabel = {
        let labelMovie = UILabel()
        labelMovie.textColor = .gray
        labelMovie.numberOfLines = 2
        labelMovie.font = UIFont.systemFont(ofSize: 18)
        labelMovie.translatesAutoresizingMaskIntoConstraints = false
        return labelMovie
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        nameMovie.text = ""
        imageMovie.image = nil
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
        contentView.addSubview(imageMovie)
        contentView.addSubview(nameMovie)
        NSLayoutConstraint.activate([
            imageMovie.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageMovie.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageMovie.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 8),
            nameMovie.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            nameMovie.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameMovie.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        nameMovie.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        imageMovie.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }

}
