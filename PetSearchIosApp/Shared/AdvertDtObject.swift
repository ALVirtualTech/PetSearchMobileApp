//
//  AdvertDtObject.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 22.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation

class AdvertDtObject {
    var id : Int
    var savedLocal: Bool = false
    
    init(_ id: Int, _ savedLocal : Bool) {
        self.id = id
        self.savedLocal = savedLocal
    }
}
