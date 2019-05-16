//
//  FirstViewController.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 13.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import UIKit
import RealmSwift

class LocalSavedAdvertsController: UIViewController {
    // Get the default Realm
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    
    var adverts : Results<Advert>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        LocalAdvertTableViewCell.register(for: tableView)
        // Self-sizing table view cells in iOS 8 require that the rowHeight property of the table view be set to the constant UITableViewAutomaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        // Self-sizing table view cells in iOS 8 are enabled when the estimatedRowHeight property of the table view is set to a non-zero value.
        // Setting the estimated row height prevents the table view from calling tableView:heightForRowAtIndexPath: for every row in the table on first load;
        // it will only be called as cells are about to scroll onscreen. This is a major performance optimization.
        tableView.estimatedRowHeight = 150.0 // set this to whatever your "average" cell height is; it doesn't need to be very accurate
        updateAdverts()
    }
    
    private func updateAdverts() {
        let adverts = try! realm.objects(Advert.self)
        self.adverts = adverts
        self.tableView.reloadData()
    }
}

extension LocalSavedAdvertsController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adverts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocalAdvertTableViewCell.identifier) as! LocalAdvertTableViewCell
        let advert = self.adverts[indexPath.row]
        cell.setup(from: advert)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        let advert = (tableView.cellForRow(at: indexPath) as! LocalAdvertTableViewCell).model
        performSegue(withIdentifier: "localAdvertsToLocalAdvert", sender: advert)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "localAdvertsToLocalAdvert" {
            let controller = segue.destination as! AdvertViewController
            controller.advert = sender as? Advert
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "localAdvertsToLocalAdvert" {
            let controller = segue.destination as! AdvertViewController
            controller.advert = sender as? Advert
        }
    }
}

