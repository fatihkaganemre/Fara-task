//
//  UserDetailsView.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit
import MapKit

struct UserDetailsViewModel {
    let onBackTapped: () -> Void
    let userBasicInfo: UserBasicInfoViewModel
}

class UserDetailsView: UIView {
    private let scrollView = UIScrollView()
    private let contentHolderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.clipsToBounds = true
        return mapView
    }()
    private let userBasicInfoView = UserBasicInfoView()
    private let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    private var backTapped: (() -> Void)?
    
    init(viewModel: UserDetailsViewModel) {
        backTapped = viewModel.onBackTapped
        super.init(frame: .zero)
        backgroundColor = .customYellow
        userBasicInfoView.bind(withViewModel: viewModel.userBasicInfo)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func backAction() {
        backTapped?()
    }
}

extension UserDetailsView {
    private func setupSubviews() {
        setupScrollView()
        setupContentHolderView()
        setupMapView()
        setupUserBasicInfoView()
        setupSeperator()
        setupBackButton()
    }
    
    private func setupScrollView() {
        addSubviewForAutolayout(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupContentHolderView() {
        scrollView.addSubviewForAutolayout(contentHolderView)
        NSLayoutConstraint.activate([
            contentHolderView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentHolderView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentHolderView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentHolderView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func setupMapView() {
        contentHolderView.addSubviewForAutolayout(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: contentHolderView.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: contentHolderView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: contentHolderView.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    private func setupUserBasicInfoView() {
        contentHolderView.addSubviewForAutolayout(userBasicInfoView)
        NSLayoutConstraint.activate([
            userBasicInfoView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            userBasicInfoView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            userBasicInfoView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
        ])
    }
    
    private func setupSeperator() {
        contentHolderView.addSubviewForAutolayout(seperator)
        NSLayoutConstraint.activate([
            seperator.topAnchor.constraint(equalTo: userBasicInfoView.bottomAnchor),
            seperator.leadingAnchor.constraint(equalTo: contentHolderView.leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: contentHolderView.trailingAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 1),
            seperator.bottomAnchor.constraint(equalTo: contentHolderView.bottomAnchor)
        ])
    }
    
    private func setupBackButton() {
        scrollView.addSubviewForAutolayout(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentHolderView.bottomAnchor, constant: 25),
            backButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
}
