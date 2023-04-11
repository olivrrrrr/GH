import Foundation

protocol AlertDelegate {
    func didShowAlert(title: String, message: String, buttonTitle: String)
    func updateData()
}

class FollowerListViewModel {
    
    var followersArray: [Follower] = []
    
    var delegate: AlertDelegate?
    
    func fetchFollowers(username: String) {
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let followers):
                self.followersArray.append(contentsOf: followers)
                self.delegate?.updateData()
                print(followers)
            case .failure(let error):
                self.delegate?.didShowAlert(title: "Bad", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

