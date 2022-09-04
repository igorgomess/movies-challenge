import UIKit

class ViewController: UIViewController {
    var movieClickedIndex: Int?

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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.idenfier
        )
        return collectionView
    }()

    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let numberCellHorizontal: CGFloat = 3

        let spacingItemHorizontal: CGFloat = 8
        let lineSpacingNumber = numberCellHorizontal - 1

        let itemWidth = (UIScreen.main.bounds.width - (spacingItemHorizontal * lineSpacingNumber) )/numberCellHorizontal - 10.6
        layout.itemSize = CGSize(width: itemWidth, height: 230)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = spacingItemHorizontal
        layout.collectionView?.backgroundColor = .black

        return layout
    }()

    var movies = [Movies]()
    var viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        viewModel.viewController = self
        viewModel.fetchMovie()
    }

    init () {
        super.init(nibName: nil, bundle: nil)
        setupConstraints()
        setupViewHierarchy()
    }

    @available(*, unavailable)
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
            collectionViewMovie.leftAnchor.constraint(equalTo: view.leftAnchor ),
            collectionViewMovie.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionViewMovie.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }

    @objc private func showDetailViewController() {
        let rootViewController = DetailsViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)

        show(navigationController, sender: nil)


    }
    func displayMovie(movies: [Movies]) {
        DispatchQueue.main.async {
            self.movies.append(contentsOf: movies)
            self.collectionViewMovie.reloadData()
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCollectionViewCell",
            for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movies = movies[indexPath.row]
        cell.nameMovie.text = movies.title
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(movies.posterPath)") else {
            return UICollectionViewCell()
        }
        cell.imageMovie.setImage(url: url)
        return cell
    }

    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)

    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieClickedIndex = indexPath.row
        showDetailViewController()
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath
    ) {
        if indexPath.row == movies.count-1 {
            viewModel.fetchMovie()
        }
    }
}

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

