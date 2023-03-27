import UIKit

protocol Coordinator {
   // var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get }
    func startCoordinator()
}

final class AppCoordinator: Coordinator {
    
    var window: UIWindow?
    
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    let navigationController = UINavigationController()
    
     let tabBarController = UITabBarController()
    
    func searchNC() -> UINavigationController {
        let searchVC = DependencyProvider.searchViewController
        searchVC.coordinator = self
        let searchNC = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return searchNC
    }
    
    func favouriteListNC() -> UINavigationController {
        let favouriteListVC = DependencyProvider.followerListVC
        let favouriteListNC = UINavigationController(rootViewController: favouriteListVC)
        favouriteListVC.title = "Favourites"
        favouriteListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return favouriteListNC
    }
    
    func startCoordinator() {
        window?.rootViewController = tabBarController
        tabBarController.viewControllers = [searchNC(), favouriteListNC()]
        window?.makeKeyAndVisible()
    }
    
    func displayFollowerListViewController() {
        let followerListVC = DependencyProvider.followerListVC
        print("okay")
        navigationController.pushViewController(followerListVC, animated: true)
    }    
}
