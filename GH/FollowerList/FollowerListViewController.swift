import UIKit

class FollowerListViewController: UIViewController, AlertDelegate {
    
    enum Section {
        case main
    }
   
    var username: String?
    var viewModel: FollowerListViewModel!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers: [Follower] = [] 

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchFollowers(username: username!)
        configureCollectionView()
        configureViewController()
        configureDataSource()
    }
    
    func didShowAlert(title: String, message: String, buttonTitle: String) {
        self.presentGHAlertOnMainThread(title: title, message: message, buttonTitle: buttonTitle)
    }

    func configureViewController() {
        navigationController?.isToolbarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.collectionThreeColumnFlowLayout(for: view))
        view.addSubview(collectionView)
      //  collectionView.backgroundColor = .systemRed
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseIdentifier)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseIdentifier, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }
}
