//
//  ViewControllerDetails.swift
//  blackMovies
//
//  Created by Igor Gomes on 18/06/22.
//

import UIKit

class ViewControllerDetails: UIViewController, UICollectionViewDataSource {


    @IBOutlet weak var testeLabel: UILabel!
    @IBOutlet weak var collectionViewDetails: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewDetails?.dataSource = self
        view.backgroundColor = .systemBlue

    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dMovies.count

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionMovieCollectionViewCell", for: indexPath) as! DescriptionMovieCollectionViewCell
        cell.setupp(with: dMovies[indexPath.row])

        return cell
    }
}

