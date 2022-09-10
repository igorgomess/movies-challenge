import UIKit

class DetailsViewController: UIViewController {

    var actors = [ActorsMovie]()
    var DetailsviewModel = DetailsViewModel()
    let idMovie: Int
    
    let imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let nameMovie: UILabel = {
        let nameMovie = UILabel()
        nameMovie.textColor = .gray
        nameMovie.translatesAutoresizingMaskIntoConstraints = false
        return nameMovie
    }()
    let yearMovie: UILabel = {
        let yearMovie = UILabel()
        yearMovie.textColor = .gray
        yearMovie.translatesAutoresizingMaskIntoConstraints = false
        return yearMovie
    }()
    let categoryMovie: UILabel = {
        let categoryMovie = UILabel()
        categoryMovie.textColor = .gray
        categoryMovie.translatesAutoresizingMaskIntoConstraints = false
        return categoryMovie
    }()

    lazy var collectionViewActors: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.idenfier
        )
        return collectionView
    }()
    
    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let numberCellHorizontal: CGFloat = 2

        let spacingItemVertical: CGFloat = 4
        let lineSpacingNumber = numberCellHorizontal - 1

        let itemWidth = (UIScreen.main.bounds.width - (spacingItemVertical * lineSpacingNumber) )/numberCellHorizontal - 83
        layout.itemSize = CGSize(width: itemWidth, height: 230)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = spacingItemVertical
        layout.collectionView?.backgroundColor = .black

        return layout
    }()

    let synopsisMovie: UILabel = {
        let synopsisMovie = UILabel()
        synopsisMovie.textColor = .gray
        synopsisMovie.numberOfLines = 10
        synopsisMovie.translatesAutoresizingMaskIntoConstraints = false
        return synopsisMovie
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configConstraints()
        DetailsviewModel.detailsViewController = self
        DetailsviewModel.fetchActor(idMovie: idMovie)
        DetailsviewModel.fetchDetailsMovie(idMovie: idMovie)
    }
    init (idMovie: Int) {
        self.idMovie = idMovie
        super .init(nibName: nil, bundle: nil)
        configConstraints()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayActorsMovie(actors: [ActorsMovie]) {
        DispatchQueue.main.async {
            self.actors = actors
            self.collectionViewActors.reloadData()
        }
    }

    func showDetailsMovie(detailsMovie: ResponseDetailsMovie){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(detailsMovie.backDropPath)")
        else { return }
        DispatchQueue.main.async {
            self.imageMovie.setImage(url: url)
            self.nameMovie.text = detailsMovie.originalTitle
            self.yearMovie.text = detailsMovie.getRealeaseDate()
            self.categoryMovie.text = detailsMovie.tagline
            self.synopsisMovie.text = detailsMovie.overview
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
            imageMovie.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageMovie.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageMovie.topAnchor.constraint(equalTo: view.topAnchor),
            imageMovie.heightAnchor.constraint(equalToConstant: 300),

            nameMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor),
            nameMovie.leftAnchor.constraint(equalTo: view.leftAnchor),

            yearMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor),
            yearMovie.leftAnchor.constraint(equalTo: nameMovie.rightAnchor, constant: 12),
            yearMovie.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor),

            categoryMovie.topAnchor.constraint(equalTo: nameMovie.bottomAnchor, constant: 8),
            categoryMovie.rightAnchor.constraint(equalTo: view.rightAnchor),
            categoryMovie.leftAnchor.constraint(equalTo: view.leftAnchor),

            collectionViewActors.topAnchor.constraint(equalTo: categoryMovie.bottomAnchor),
            collectionViewActors.heightAnchor.constraint(equalToConstant: 250),
            collectionViewActors.leftAnchor.constraint(equalTo: view.leftAnchor ),
            collectionViewActors.rightAnchor.constraint(equalTo: view.rightAnchor),

            synopsisMovie.topAnchor.constraint(equalTo: collectionViewActors.bottomAnchor),
            synopsisMovie.leftAnchor.constraint(equalTo: view.leftAnchor),
            synopsisMovie.rightAnchor.constraint(equalTo: view.rightAnchor),
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
        let actorMovie = actors[indexPath.row]
        let image = "https://image.tmdb.org/t/p/w500\(actorMovie.profilePath ?? "")"
        let viewModel = DetailsCollectionViewCell.ViewModel(imageURL: image, text: actorMovie.name)
        cell.setup(viewModel: viewModel)
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)

    }
}


