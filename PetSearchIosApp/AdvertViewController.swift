//
//  AdvertViewController.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 16.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import UIKit
import RealmSwift

class AdvertViewController: UIViewController {
    var advert: Advert?
    @IBOutlet weak var cardTitleLabel: UINavigationItem!
    
    @IBOutlet weak var backBarBtn: UIBarButtonItem!
    @IBOutlet weak var SaveLocalBarBtn: UIBarButtonItem!
    
    var advertPersistanceState: Bool = false;
    
    @IBAction func backBtnClickAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveLocalClickAction(_ sender: Any) {
        if saveAdvert() {
            //dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var vaccinationsLabel: UILabel!
    @IBOutlet weak var coatColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Reading object
        if let advert = advert {
            cardTitleLabel.title = advert.title
            cardTitleLabel.prompt = advert.title
            if let decodedData = Data(base64Encoded: advert.image, options: .ignoreUnknownCharacters) {
                let image = UIImage(data: decodedData)
                self.petImageView.image = image
            }
            descriptionTextView.text = advert.descr
            breedLabel.text = advert.breed
            coatColorLabel.text = advert.coatColor
            vaccinationsLabel.text = advert.vaccinations ? "есть" : "нет"
            heightLabel.text = "\(advert.height) м"
            weightLabel.text = "\(advert.weight) кг"
            
            // Query using an NSPredicate
            let predicate = NSPredicate(format: "id = %i", advert.id)
            if let savedAdvert = uiRealm.objects(Advert.self).filter(predicate).first {
                advertPersistanceState = false
                saveAdvert()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func saveAdvert() -> Bool {
        if advertPersistanceState {
            return deleteAdvert()
        }
        try! uiRealm.write {
            uiRealm.add(advert!, update: true)
        }
        SaveLocalBarBtn.title = "Удалить"
        advertPersistanceState = true
        return true
    }
    
    func deleteAdvert() -> Bool {
        // Delete an object with a transaction
        try! uiRealm.write {
            uiRealm.delete(advert!)
        }
        SaveLocalBarBtn.title = "Сохранить"
        advertPersistanceState = false
        return true;
    }
}
