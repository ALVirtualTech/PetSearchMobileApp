//
//  Advert.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 13.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation

class Advert {
    var id: Int
    var title: String
    var description: String
    var image: String
    var breed: String //порода
    var age: String
    var vaccinations: Bool
    var height: Float
    var weight: Float
    var coatColor: String //цвет шерсти
    
    var getId : Int {
        return id
    }
    
    var getTitle: String {
        return title
    }
    
    var getDescription: String {
        return description
    }
    
    var getImage: String {
        return image
    }
    
    init?(from json: JSON) {
        guard
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let description = json["description"] as? String,
            let image = json["image"] as? String,
            let breed = json["breed"] as? String,
            let coatColor = json["coatColor"] as? String,
            let age = json["age"] as? String,
            let vaccinations = json["vaccinations"] as? Bool,
            let height = json["height"] as? Float,
            let weight = json["weight"] as? Float
            else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.breed = breed
        self.coatColor = coatColor
        self.age = age
        self.vaccinations = vaccinations
        self.height = height
        self.weight = weight
    }
    
}
