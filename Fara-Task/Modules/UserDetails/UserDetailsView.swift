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
    let mapViewModel: MapViewModel
    let email: String
    let phone: String
    let company: String

    struct MapViewModel {
        let mapAnnotationTitle: String
        let latitute: String
        let longitute: String
    }
}

class UserDetailsView: UIView {
    private let scrollView = UIScrollView()
    private let contentHolderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    private var mapView: MKMapView!
    private let userBasicInfoView = UserBasicInfoView()
    private let seperator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let companyLabel = UILabel()
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
    
    deinit {
        mapView = nil
    }
    
    init(viewModel: UserDetailsViewModel) {
        backTapped = viewModel.onBackTapped
        mapView = MapViewHelper().mapView(
            title: viewModel.mapViewModel.mapAnnotationTitle,
            latitute: viewModel.mapViewModel.latitute,
            longitute: viewModel.mapViewModel.longitute
        )
        super.init(frame: .zero)
        backgroundColor = .customYellow
        setupSubviews()
        bind(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind(with viewModel: UserDetailsViewModel) {
        userBasicInfoView.bind(withViewModel: viewModel.userBasicInfo)
        emailLabel.attributedText = makeKeyValueAttributedText(key: "Email", value: viewModel.email)
        phoneLabel.attributedText = makeKeyValueAttributedText(key: "Phone", value: viewModel.phone)
        companyLabel.attributedText = makeKeyValueAttributedText(key: "Company", value: viewModel.company)
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
        setupStackView()
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
            userBasicInfoView.trailingAnchor.constraint(equalTo: mapView!.trailingAnchor),
        ])
    }
    
    private func setupSeperator() {
        contentHolderView.addSubviewForAutolayout(seperator)
        NSLayoutConstraint.activate([
            seperator.topAnchor.constraint(equalTo: userBasicInfoView.bottomAnchor),
            seperator.leadingAnchor.constraint(equalTo: contentHolderView.leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: contentHolderView.trailingAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupStackView() {
        contentHolderView.addSubviewForAutolayout(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentHolderView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentHolderView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentHolderView.bottomAnchor, constant: -50)
        ])
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(companyLabel)
    }
    
    private func makeKeyValueAttributedText(key: String, value: String) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        let attributedTitle = NSAttributedString(
            string: key + ": ",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        )
        mutableAttributedString.append(attributedTitle)
        
        let attributedAddress = NSAttributedString(
            string: value,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light),
                NSAttributedString.Key.foregroundColor: UIColor.darkGray
            ]
        )
        mutableAttributedString.append(attributedAddress)
        
        return mutableAttributedString
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
