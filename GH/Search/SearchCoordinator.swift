import UIKit

class SearchCoordinator: Coordinator {
  //  var navigationController: UINavigationController
    
    let tabBarController: UITabBarController
    
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func searchNC() -> UINavigationController {
        let searchVC = DependencyProvider.searchViewController
        // searchVC.coordinator = self
        let searchNC = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return searchNC
    }
    
    func startCoordinator() {
        tabBarController.setViewControllers([searchNC()], animated: false)
    }
}
