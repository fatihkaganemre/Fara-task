//
//  UserBasicInfoView.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

struct UserBasicInfoViewModel {
    let name: String
    let address: String
}

class UserBasicInfoView: UIView {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private let userIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userIcon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
    }
    
    func bind(withViewModel viewModel: UserBasicInfoViewModel) {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserBasicInfoView {
    private func setupSubviews() {
        setupNameLabel()
        setupAddressLabel()
        setupUserIcon()
    }
    
    private func setupNameLabel() {
        addSubviewForAutolayout(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    private func setupAddressLabel() {
        addSubviewForAutolayout(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            addressLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func setupUserIcon() {
        addSubviewForAutolayout(userIcon)
        NSLayoutConstraint.activate([
            userIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            userIcon.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            userIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userIcon.widthAnchor.constraint(equalToConstant: 25),
            userIcon.heightAnchor.constraint(equalTo: userIcon.widthAnchor)
        ])
    }
}
