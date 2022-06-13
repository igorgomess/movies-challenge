//
//  ViewController.swift
//  blackMovies
//
//  Created by Igor Gomes on 07/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    @IBAction func tabsMovies(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            break

        case 1:
            break



        default:
            break

        }
    }

    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }

}

    extension ViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print(moviesPopular)
            return moviesPopular.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.set(with: moviesPopular[indexPath.row])
            return cell
        }
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return movies.count
//        }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
//            cell.setup(with: movies[indexPath.row])
//            return cell
//        }

   }

