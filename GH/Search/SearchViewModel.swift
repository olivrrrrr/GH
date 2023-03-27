//
//  searchViewModel.swift
//  GH
//
//  Created by Oliver Ekwalla on 27/03/2023.
//

import Foundation


class SearchViewModel {
    
    var appCoordinator: AppCoordinator?
    
    func goToFollowerList(username: String) {
        appCoordinator?.goToFollowerList(username: username)
    }
}
