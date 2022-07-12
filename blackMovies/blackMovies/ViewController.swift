//
//  ViewController.swift
//  blackMovies
//
//  Created by Igor Gomes on 07/06/22.
//

import UIKit

    class ViewController: UIViewController {

        var movieClickedIndex: Int?

        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var collectionView: UICollectionView!
        @IBAction func tabsMovies(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                 movies = moviesUpcomig
                 collectionView.reloadData()
                 titleLabel.text = "Upcomig Movies"
            case 1:
                 movies = moviesPopular
                 collectionView.reloadData()
                 titleLabel.text = "Popular Movies"
            default:
                 break
            }
         }

        var movies: [Movie] = []

         override func viewDidLoad() {
             super.viewDidLoad()
             movies = moviesUpcomig
             titleLabel.text = "Upcomig Movies"
             collectionView.dataSource = self
             collectionView.delegate = self
         }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext", let destinationVc = segue.destination as? DetailsViewController {
            guard let movieClickedIndex = movieClickedIndex else {
                return
            }
            destinationVc.movie = movies[movieClickedIndex]
            destinationVc.indexMovies = movieClickedIndex
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return movies.count
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCollectionViewCell",
            for: indexPath) as? MovieCollectionViewCell else {
           return UICollectionViewCell()
       }
     cell.setup(with: movies[indexPath.row])
     return cell
    }

}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieClickedIndex = indexPath.row

        performSegue(withIdentifier: "goToNext", sender: self)

    }

}
