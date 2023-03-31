import UIKit

protocol Coordinator {
   var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func startCoordinator()
}

final class AppCoordinator: Coordinator {
    
    var navigationController = UINavigationController()
    var window: UIWindow?
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }

    func startCoordinator() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        goToHome()
    }

//    func goToSearch() {
//        let child = SearchCoordinator(navigationController: navigationController)
//        child.parentCoordinator = self
//        childCoordinators.append(child)
//        child.startCoordinator()
//    }
//
    func goToHome() {
        // Initiate HomeTabBar Coordinator
        let coordinator = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.removeAll()
        coordinator.parentCoordinator = self
        coordinator.startCoordinator()
    }

}
