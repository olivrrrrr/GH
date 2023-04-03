import Foundation

protocol AlertDelegate {
    func didShowAlert(title: String, message: String, buttonTitle: String)
    func updateData()
    var followers: [Follower] { get set }
}

class FollowerListViewModel {
    
    var delegate: AlertDelegate?
    
    func fetchFollowers(username: String) {
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let followers):
                // TODO: Optimised
                self.delegate?.followers = followers
                self.delegate?.updateData()
                print(followers)
            case .failure(let error):
                self.delegate?.didShowAlert(title: "Bad", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

