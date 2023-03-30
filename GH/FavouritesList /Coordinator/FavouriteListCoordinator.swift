import UIKit

class FavouriteListCoordinator: Coordinator {
    
     var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        print("HistoryCoordinator Start")
        
        let vc = FavouriteListViewController() 
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    deinit {
        print("Deinit FavouriteListCoordinator Coordinator")
    }
}
