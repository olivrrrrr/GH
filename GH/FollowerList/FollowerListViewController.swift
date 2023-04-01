//
//  FollowerListViewController.swift
//  GH
//
//  Created by Oliver Ekwalla on 06/03/2023.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String?
    var viewModel: FollowerListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        viewModel.fetchFollowers(username: username!)
    }

}
