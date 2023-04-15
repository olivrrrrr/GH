import UIKit

class FollowerListViewController: UIViewController, AlertDelegate {
    
    enum Section {
        case main
    }
   
    var username: String?
    var page: Int = 1
    var viewModel: FollowerListViewModel!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchFollowers(username: username!, page: page)
        configureCollectionView()
        configureViewController()
        configureDataSource()
    }
    
    func didShowAlert(title: String, message: String, buttonTitle: String) {
        self.presentGHAlertOnMainThread(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func didShowLoadingView() {
        self.showLoadingView()
    }
    
    func didDismissLoadingView() {
        self.dismissLoadingView()
    }

    func configureViewController() {
        navigationController?.isToolbarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.collectionThreeColumnFlowLayout(for: view))
        collectionView.accessibilityIdentifier = "Collection View"
        view.addSubview(collectionView)
      //  collectionView.backgroundColor = .systemRed
        collectionView.delegate = self
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
        snapshot.appendItems(viewModel.followersArray)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension FollowerListViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate delecerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height  = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard viewModel.hasMoreFollowers else { return }
            self.page += 1
            // guard let username = username else { return }
            viewModel.fetchFollowers(username: username!, page: page)
        }
    }
}
