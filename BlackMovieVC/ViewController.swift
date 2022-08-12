//
//  ViewController.swift
//  BlackMovieVC
//
//  Created by Igor Gomes on 10/08/22.
//

import UIKit

class ViewController: UIViewController {

    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl (items: ["Upcoming", "Popular"])
        segmentedControl.backgroundColor = .black
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    let labelTitle: UILabel = {
        let title = UILabel()
        title.text = "Upcoming Movies"
        title.font = UIFont.systemFont(ofSize: 30.0)
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var collectionViewMovie: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.idenfier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
    }

    init () {
        super.init(nibName: nil, bundle: nil)
        setupConstraints()
        setupViewHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {
        view.addSubview(labelTitle)
        view.addSubview(segmentedControl)
        view.addSubview(collectionViewMovie)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -90.0),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90.0),
            labelTitle.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            labelTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12.0 ),
            labelTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 12.0),
            collectionViewMovie.topAnchor.constraint(equalTo: labelTitle.bottomAnchor,constant: 10),
            collectionViewMovie.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -90 ),
            collectionViewMovie.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 12),
            collectionViewMovie.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),


        ])
    }
}

