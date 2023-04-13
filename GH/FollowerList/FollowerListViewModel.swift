import Foundation

protocol AlertDelegate {
    func didShowAlert(title: String, message: String, buttonTitle: String)
    func updateData()
}

class FollowerListViewModel {
    
    var followersArray: [Follower] = []
    var hasMoreFollowers: Bool = true
    var delegate: AlertDelegate?
    
    func fetchFollowers(username: String, page: Int) {
        print(page)
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let followers):
                if followers.count < 30 { self.hasMoreFollowers = false }
                self.followersArray.append(contentsOf: followers)
                self.delegate?.updateData()
                print(followers.count)
            case .failure(let error):
                self.delegate?.didShowAlert(title: "Bad", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

