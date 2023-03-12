//
//  SceneDelegate.swift
//  GH
//
//  Created by Oliver Ekwalla on 02/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
//        window = UIWindow(frame: scene.coordinateSpace.bounds)
//        window?.windowScene = scene
        
        let window = UIWindow(windowScene: scene)
//        self.window = window

//        window.rootViewController = ViewController()
//        window.makeKeyAndVisible()
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.startCoordinator()
    }
}

