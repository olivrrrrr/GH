import Foundation

protocol AlertDelegate {
    func didShowAlert(title: String, message: String, buttonTitle: String)
}

class FollowerListViewModel {
    
    var delegate: AlertDelegate?
    
    func fetchFollowers(username: String) {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result{
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.delegate?.didShowAlert(title: "Bad", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

