//
//  searchViewModel.swift
//  GH
//
//  Created by Oliver Ekwalla on 27/03/2023.
//

import Foundation


class SearchViewModel {

    weak var coordinator: SearchCoordinator?
    
    func goToFollowerList(username: String) {
        coordinator?.goToFollowerList(username: username)
    }
}
