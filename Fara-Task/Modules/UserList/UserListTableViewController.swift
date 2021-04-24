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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.reoladTable = { [tableView] in
            tableView?.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.users?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let users = interactor.users else { return .init() }
        let cell = tableView.dequeueReusableCell(UserListCell.self)
        let user = users[indexPath.row]
        let viewModel = UserListCellViewModel(
            name: user.name,
            address: user.address.openAddress,
            onTap: { [interactor] in interactor.onTap(user: user) }
        )
        cell.bind(withViewModel: viewModel)
        return cell
    }
}
