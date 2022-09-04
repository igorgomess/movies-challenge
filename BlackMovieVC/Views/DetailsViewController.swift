import UIKit

class DetailsViewController: UIViewController {
    var actors = [ActorsMovie]()
    var DetailsviewModel = DetailsViewModel()
    let imageMovie: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"doctorstrange")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let nameMovie: UILabel = {
        let nameMovie = UILabel()
        nameMovie.textColor = .black
        nameMovie.text = "nameMovie"
        nameMovie.translatesAutoresizingMaskIntoConstraints = false
        return nameMovie
    }()
    let yearMovie: UILabel = {
        let yearMovie = UILabel()
        yearMovie.textColor = .black
        yearMovie.text = "yearMovie"
        yearMovie.translatesAutoresizingMaskIntoConstraints = false
        return yearMovie
    }()
    let categoryMovie: UILabel = {
        let categoryMovie = UILabel()
        categoryMovie.textColor = .black
        categoryMovie.text = "categoryMovie"
        categoryMovie.translatesAutoresizingMaskIntoConstraints = false
        return categoryMovie
    }()

    lazy var collectionViewActors: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.idenfier
        )
        return collectionView
    }()
    
    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let numberCellHorizontal: CGFloat = 3

        let spacingItemHorizontal: CGFloat = 8
        let lineSpacingNumber = numberCellHorizontal - 1

        let itemWidth = (UIScreen.main.bounds.width - (spacingItemHorizontal * lineSpacingNumber) )/numberCellHorizontal - 10.6
        layout.itemSize = CGSize(width: itemWidth, height: 40)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = spacingItemHorizontal
        layout.collectionView?.backgroundColor = .black

        return layout
    }()

    let synopsisMovie: UILabel = {
        let synopsisMovie = UILabel()
        synopsisMovie.backgroundColor = .yellow
        synopsisMovie.textColor = .black
        synopsisMovie.text = "synopsisMovie"
        synopsisMovie.translatesAutoresizingMaskIntoConstraints = false
        return synopsisMovie
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configConstraints()
        DetailsviewModel.detailsViewController = self
        DetailsviewModel.fetchActor()
    }
    init () {
        super .init(nibName: nil, bundle: nil)
        configConstraints()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayMovie(actors: [ActorsMovie]) {
        DispatchQueue.main.async {
            self.actors = actors
            self.collectionViewActors.reloadData()
        }
    }
    func showError(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops, ocorreu um erro", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }


}

extension DetailsViewController {
    private func configConstraints() {
        view.addSubview(imageMovie)
        view.addSubview(nameMovie)
        view.addSubview(yearMovie)
        view.addSubview(categoryMovie)
        view.addSubview(collectionViewActors)
        view.addSubview(synopsisMovie)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageMovie.widthAnchor.constraint(equalToConstant: 420),
            imageMovie.heightAnchor.constraint(equalToConstant: 470),

            nameMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor),
            nameMovie.leftAnchor.constraint(equalTo: view.leftAnchor),

            yearMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor),
            yearMovie.leftAnchor.constraint(equalTo: nameMovie.rightAnchor),
            yearMovie.rightAnchor.constraint(equalTo: view.rightAnchor),

            categoryMovie.topAnchor.constraint(equalTo: nameMovie.bottomAnchor),
            categoryMovie.rightAnchor.constraint(equalTo: view.rightAnchor),
            categoryMovie.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoryMovie.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -300),

            collectionViewActors.topAnchor.constraint(equalTo: categoryMovie.bottomAnchor),
            collectionViewActors.leftAnchor.constraint(equalTo: view.leftAnchor ),
            collectionViewActors.rightAnchor.constraint(equalTo: view.rightAnchor),

            synopsisMovie.topAnchor.constraint(equalTo: collectionViewActors.bottomAnchor),
            synopsisMovie.leftAnchor.constraint(equalTo: view.leftAnchor),
            synopsisMovie.rightAnchor.constraint(equalTo: view.rightAnchor),
            synopsisMovie.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "DetailsCollectionViewCell",
            for: indexPath) as? DetailsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let actors = actors[indexPath.row]
        cell.nameActor.text = actors.name
        guard let actorsPath = actors.profilePath else {
            return UICollectionViewCell()
        }
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(actorsPath)") else {
            return UICollectionViewCell()
        }
        cell.imageActor.setImage(url: url)
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)

    }
}


