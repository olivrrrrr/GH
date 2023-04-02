//
//  GHAvatarImageView.swift
//  GH
//
//  Created by Oliver Ekwalla on 01/04/2023.
//

import UIKit

class GHAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder-dark")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
}
