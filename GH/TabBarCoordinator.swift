import UIKit

class TabBarCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator]  = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        print("HomeTabbar Coordinator Init")
        initializeHomeTabBar()
    }
    
    deinit {
        print("HomeTabbar Coordinator Deinit")
    }
    
    func initializeHomeTabBar(){
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .white
        // Instantiate all related coordinators and views also dependecies like VM or API Services.
        // We want each section has their own navigation controller, rather than app wide view controller.
        let searchNavigationController = UINavigationController()
        let searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
        // we want to home coordinator connected to the App Coordinator, because the HomeTabbar coordinator only serves as a container.
        searchCoordinator.parentCoordinator = parentCoordinator as? AppCoordinator
        // Create the tabbar item for tabbar.
       let searchItem = UITabBarItem()
       searchItem.title = "SEARCH"
       searchItem.image = UIImage(systemName: "magnifyingglass")
       searchNavigationController.tabBarItem = searchItem
        
        let favouriteListNavigationController = UINavigationController()
        let favouriteListCoordinator = FavouriteListCoordinator(navigationController: favouriteListNavigationController)
        
        let favouriteListItem = UITabBarItem()
        favouriteListItem.title = "FAVOURITE"
        favouriteListItem.image = UIImage(systemName: "star.fill")
        favouriteListNavigationController.tabBarItem = favouriteListItem
        
        tabBar.viewControllers = [searchNavigationController, favouriteListNavigationController]
        
        navigationController.pushViewController(tabBar, animated: true)
        navigationController.setNavigationBarHidden(true, animated: true)
        
        parentCoordinator?.childCoordinators.append(searchCoordinator)
        parentCoordinator?.childCoordinators.append(favouriteListCoordinator)
          
        searchCoordinator.startCoordinator()
        favouriteListCoordinator.startCoordinator()
     }
}
