//
//  StringUtils.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 14.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

class StringUtils {
    static let EMPTY_STRING : String = "";
    
    static let ETC_STRING : String = "...";
    
    /*
     * Обрезать длинную строку до допустимой длины, добавив в конце строки многоточие
     */
    static func truncate(_ source : String, length : Int) -> String {
        if length <= 0 {
            return EMPTY_STRING
        }
        if source.length <= length {
            return source
        }
        return source.prefix(length) + ETC_STRING
    }
}

extension String {
    var length: Int { return count }
}
