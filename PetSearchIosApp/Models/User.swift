//
//  User.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 13.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//
class User {
    
    var id: Int
    var username: String
    var email: String
    
    init?(from json: JSON) {
        guard
            let id = json["id"] as? Int,
            let username = json["username"] as? String,
            let email = json["email"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.username = username
        self.email = email
    }
    
}
