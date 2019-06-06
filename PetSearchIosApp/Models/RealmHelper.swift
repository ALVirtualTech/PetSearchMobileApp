//
//  RealmHelper.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 22.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    // Get the default Realm
    static let uiRealm = try! Realm()
    
    /**
     * Возвращает сохраненное в локальном хранилище объявление
     * @param id идентификатор объявления
     * @return объявление либо nil
     */
    static func getAdvert(_ id: Int) -> Advert? {
        let predicate = NSPredicate(format: "id = %i", id)
        return uiRealm.objects(Advert.self).filter(predicate).first
    }
    
    /**
     * Сохраняет объявление в локальном хранилище данных
     * Нельзя сохранить nil объявление
     * @param advert ообъект объявления для сохранения
     */
    static func saveAdvert(_ advert : Advert) {
        try! uiRealm.write {
            uiRealm.add(advert, update: true)
        }
    }
    
    /**
     * Удаляет объявление из локального хранилища данных
     * @param advert ообъект объявления для удаления
     */
    static func deleteAdvert(_ advert : Advert) {
        // Delete an object with a transaction
        try! uiRealm.write {
            uiRealm.delete(advert)
        }
    }
    
    /**
     * Определить, сохранено ли в локальном хранилище объявление или нет
     * @param id идентификатор объявления
     */
    static func isAdvertSavedLocal(_ id: Int) -> Bool {
        let predicate = NSPredicate(format: "id = %i", id)
        if uiRealm.objects(Advert.self).filter(predicate).first != nil {
            return true
        }
        else {
            return false
        }
    }
}
