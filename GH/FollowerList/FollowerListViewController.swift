//
//  FollowerListViewController.swift
//  GH
//
//  Created by Oliver Ekwalla on 06/03/2023.
//

import UIKit

class FollowerListViewController: UIViewController, AlertDelegate {
    var username: String?
    var viewModel: FollowerListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        viewModel.delegate = self
        viewModel.fetchFollowers(username: username!)
    }
    
    func didShowAlert(title: String, message: String, buttonTitle: String) {
        self.presentGHAlertOnMainThread(title: title, message: message, buttonTitle: buttonTitle)
    }
}
