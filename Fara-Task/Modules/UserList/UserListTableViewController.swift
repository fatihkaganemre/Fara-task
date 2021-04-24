//
//  UserListViewController.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

class UserListTableViewController: UITableViewController {
    private let interactor: UserListInteractor
    
    init(interactor: UserListInteractor) {
        self.interactor = interactor
        super.init(style: .plain)
        tableView.registerReusableCell(UserListCell.self)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .customYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UserListCell.self)
        let viewModel = UserListCellViewModel(
            name: "name",
            address: "address",
            onTap: { [interactor] in
                interactor.onTap(user: User(id: 1, name: "name", username: "name", email: "email", address: .init(street: "street", suite: "suite", city: "city", zipcode: "code", geo: User.Address.Geo.init(lat: "123", lng: "1234")), phone: "123", website: URL(string: "123")!, company: User.Company.init(name: "name", catchPhrase: "ha", bs: "ba")))
            }
        )
        cell.bind(withViewModel: viewModel)
        return cell
    }
}
