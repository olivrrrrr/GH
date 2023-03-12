import Foundation

struct DependencyProvider {
    
    static var followerListVC: FollowerListViewController {
        let followerListVC = FollowerListViewController()
        return followerListVC
    }
    
    static var searchViewController: SearchViewController {
        let searchViewController = SearchViewController()
        return searchViewController
    }
}
