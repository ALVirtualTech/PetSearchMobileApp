//
//  Advert.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 13.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Advert : Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var descr: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var breed: String = "" //порода
    //var age: String
    @objc dynamic var vaccinations: Bool = false
    @objc dynamic var height: Double = 0.0
    @objc dynamic var weight: Double = 0.0
    @objc dynamic var coatColor: String = "" //цвет шерсти
    
    required init (id : Int, title : String, descr : String, image : String, breed : String, vaccinations : Bool, height : Double, weight : Double, coatColor : String) {
        super.init()
        self.id = id
        self.title = title
        self.descr = descr
        self.image = image
        self.breed = breed
        self.vaccinations = vaccinations
        self.height = height
        self.weight = weight
        self.coatColor = coatColor
    }
    
    required convenience init?(from json: JSON) {
        self.init()
        guard
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let descr = json["description"] as? String,
            let image = json["image"] as? String,
            let breed = json["breed"] as? String,
            let coatColor = json["coatColor"] as? String,
            //let age = json["age"] as? String,
            let vaccinations = json["vaccinations"] as? Bool,
            let height = json["height"] as? Double,
            let weight = json["weight"] as? Double
            else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.descr = descr
        self.image = image
        self.breed = breed
        self.coatColor = coatColor
        //self.age = age
        self.vaccinations = vaccinations
        self.height = height
        self.weight = weight
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
