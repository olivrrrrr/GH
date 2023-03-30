import UIKit

class SearchViewController: UIViewController {
    
    enum Constants {
        static let ghLogo = "gh-logo"
    }
    
    var viewModel: SearchViewModel!
    weak var coordinator: SearchCoordinator?

    let logoImageView = UIImageView()
    let usernameTextField = GHTextField()
    let searchUserButton = GHButton(backgroundColor: .systemGreen, title: "Search followers")
    
    var isUsernameEntered: Bool {
        guard let usernameText = usernameTextField.text else {
            return false
        }
        return !usernameText.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureButton()
        createDismissKeyboardTapGsture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
    
    func createDismissKeyboardTapGsture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushViewController() {
        guard isUsernameEntered else {
            presentGHAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for", buttonTitle: "Okay")
            return
        }
        guard let username = usernameTextField.text else { return }
        viewModel.goToFollowerList(username: username)
    }
}

extension SearchViewController {
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: Constants.ghLogo)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            // at least 44 points high
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureButton() {
        view.addSubview(searchUserButton)
        
        searchUserButton.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchUserButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchUserButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushViewController()
        return true 
    }
    
}
