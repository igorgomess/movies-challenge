//
//  DetailsViewController.swift
//  blackMovies
//
//  Created by Igor Gomes on 21/06/22.
//

import UIKit

class DetailsViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var synopsisMovie: UILabel!

    var movie: Movie?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageMovie.image = movie?.image
        nameMovie.text = movie?.title
        yearMovie.text = movie?.dateMovie
        descriptionMovie.text = movie?.details[0].description
        synopsisMovie.text = movie?.details[0].synopsis
//        collectionView.dataSource = self
        



    }
    

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return moviesUpcomig.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
//        cell.setup(with: testando[indexPath.row])
//        return cell
//    }

}

