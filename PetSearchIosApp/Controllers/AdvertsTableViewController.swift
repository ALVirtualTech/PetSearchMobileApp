//
//  SecondViewController.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 13.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import UIKit

class AdvertsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var adverts = [Advert]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        AdvertTableViewCell.register(for: tableView)
        
        updateTodos()
    }
    
    private func updateTodos() {
        API.Pets.Adverts().send { [weak self] (apiModels) in
            guard let self = self else { return }
            self.adverts = apiModels.compactMap{ Advert(from: $0) }
            self.tableView.reloadData()
        }
    }
}

extension AdvertsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adverts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AdvertTableViewCell.identifier) as! AdvertTableViewCell
        let advert = self.adverts[indexPath.row]
        cell.setup(from: advert)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
