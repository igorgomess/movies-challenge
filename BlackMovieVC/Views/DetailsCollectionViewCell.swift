//
//  DetailsCollectionViewCell.swift
//  BlackMovieVC
//
//  Created by Igor Gomes on 02/09/22.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {

    static let idenfier: String = "DetailsCollectionViewCell"

    let imageActor: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let nameActor: UILabel = {
        let nameActor = UILabel()
        nameActor.textColor = .white
        nameActor.numberOfLines = 2
        nameActor.font = UIFont.systemFont(ofSize: 18)
        nameActor.translatesAutoresizingMaskIntoConstraints = false
        return nameActor
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        nameActor.text = ""
        imageActor.image = nil
    }


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
        contentView.addSubview(imageActor)
        contentView.addSubview(nameActor)
        NSLayoutConstraint.activate([
            imageActor.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageActor.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageActor.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameActor.topAnchor.constraint(equalTo: imageActor.bottomAnchor, constant: 8),
            nameActor.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            nameActor.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameActor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        nameActor.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        imageActor.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

}
