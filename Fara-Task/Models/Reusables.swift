//
//  Reusables.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String { String(describing: Self.self) }
}

extension UITableView {
    func registerReusableCell<Cell: UITableViewCell>(_ cell: Cell.Type) where Cell: Reusable {
        register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(_ cell: Cell.Type) -> Cell where Cell: Reusable {
        return dequeueReusableCell(withIdentifier: Cell.reuseIdentifier) as! Cell
    }
}
