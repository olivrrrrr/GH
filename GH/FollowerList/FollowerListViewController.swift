//
//  FollowerListViewController.swift
//  GH
//
//  Created by Oliver Ekwalla on 06/03/2023.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username!, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGHAlertOnMainThread(title: "Bad", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            print(followers)
        }
    }

}
