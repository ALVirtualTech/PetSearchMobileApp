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
    var advertDto : AdvertDtObject?
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
        if let advertDto = advertDto {
            if RealmHelper.isAdvertSavedLocal(advertDto.id) {
                advert = RealmHelper.getAdvert(advertDto.id)
                fillProperties()
            } else {
                API.Pets.Advert().send(params: API.Pets.Advert().getParams(advertDto.id),
                                       completion: { [weak self] (model) in
                    guard let self = self else { return }
                    self.advert = Advert(from: model)
                    self.fillProperties()
                })
            }
        }
    }
    
    func fillProperties()
    {
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
            if RealmHelper.isAdvertSavedLocal(advert.id) {
                advertPersistanceState = true
                SaveLocalBarBtn.title = "Удалить"
            }
        }
    }
    
    func saveAdvert() -> Bool {
        if advertPersistanceState {
            return deleteAdvert()
        }
        RealmHelper.saveAdvert(advert!)
        advert = RealmHelper.getAdvert(advertDto!.id)
        NotificationCenter.default.post(name: Notification.Name("ReceiveData"), object: nil)
        fillProperties()
        SaveLocalBarBtn.title = "Удалить"
        advertPersistanceState = true
        return true
    }
    
    func deleteAdvert() -> Bool {
        RealmHelper.deleteAdvert(advert!)
        NotificationCenter.default.post(name: Notification.Name("ReceiveData"), object: nil)
        API.Pets.Advert().send(params: API.Pets.Advert().getParams(advertDto!.id),
                               completion: { [weak self] (model) in
                                guard let self = self else { return }
                                self.advert = Advert(from: model)
                                self.fillProperties()
        })
        SaveLocalBarBtn.title = "Сохранить"
        advertPersistanceState = false
        return true;
    }
}
