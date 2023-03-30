import UIKit

class SearchCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = [] 
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let searchVC = DependencyProvider.searchViewController
        let searchViewModel = SearchViewModel()
        searchViewModel.coordinator = self
        searchVC.viewModel = searchViewModel
        navigationController.pushViewController(searchVC, animated: false)
    }
    
    func goToFollowerList(username: String) {
        let followerListVC = DependencyProvider.followerListVC
        followerListVC.username = username
        followerListVC.title = username
        navigationController.pushViewController(followerListVC, animated: true)
    }
    
//    func didFinishBuying() {
//        parentCoordinator?.childDidFinish(self)
//    }
    
    deinit {
        print("buy deinit")
    }
    
}
