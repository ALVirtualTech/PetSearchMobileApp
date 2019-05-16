//
//  UITableViewCell+Extensions.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 14.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}

extension UITableViewCell {
    
    static func register(for tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
}
