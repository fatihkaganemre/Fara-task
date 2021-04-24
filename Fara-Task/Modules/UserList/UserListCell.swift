//
//  UserListView.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

struct UserListCellViewModel {
    let userBasicInfo: UserBasicInfoViewModel
    let onTap: () -> Void
}

class UserListCell: UITableViewCell, Reusable {
    private let userBasicInfoView: UserBasicInfoView = {
        let view = UserBasicInfoView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
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
        userBasicInfoView.bind(withViewModel: viewModel.userBasicInfo)
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
    }
    
    private func setupHolderView() {
        contentView.addSubviewForAutolayout(userBasicInfoView)
        NSLayoutConstraint.activate([
            userBasicInfoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            userBasicInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userBasicInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userBasicInfoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
