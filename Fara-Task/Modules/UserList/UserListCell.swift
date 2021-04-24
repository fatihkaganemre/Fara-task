//
//  UserListView.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

struct UserListCellViewModel {
    let name: String
    let address: String
    let onTap: () -> Void
}

class UserListCell: UITableViewCell, Reusable {
    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
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
    private var onTap: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupSubviews()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(withViewModel viewModel: UserListCellViewModel) {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        onTap = viewModel.onTap
    }
    
    @objc private func tapAction() {
        onTap?()
    }
}

// MARK: - AutoLayout
extension UserListCell {
    private func setupSubviews() {
        setupHolderView()
        setupNameLabel()
        setupAddressLabel()
        setupUserIcon()
    }
    
    private func setupHolderView() {
        contentView.addSubviewForAutolayout(holderView)
        NSLayoutConstraint.activate([
            holderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            holderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            holderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            holderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupNameLabel() {
        holderView.addSubviewForAutolayout(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 16),
        ])
    }
    
    private func setupAddressLabel() {
        holderView.addSubviewForAutolayout(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            addressLabel.bottomAnchor.constraint(lessThanOrEqualTo: holderView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupUserIcon() {
        holderView.addSubviewForAutolayout(userIcon)
        NSLayoutConstraint.activate([
            userIcon.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
            userIcon.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            userIcon.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -16),
            userIcon.widthAnchor.constraint(equalToConstant: 25),
            userIcon.heightAnchor.constraint(equalTo: userIcon.widthAnchor)
        ])
    }
}
