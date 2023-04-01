//
//  FollowerListViewModel.swift
//  GH
//
//  Created by Oliver Ekwalla on 01/04/2023.
//

import UIKit

class FollowerListViewModel: UIViewController  {

    weak var coordinator: SearchCoordinator?
    
    func fetchFollowers(username: String) {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result{
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "Bad", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}
