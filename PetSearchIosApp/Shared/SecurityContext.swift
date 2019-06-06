//
//  SecurityContext.swift
//  PetSearchIosApp
//
// Текущий контекст авторизации (синглтон).
// Данные авторизации (логин/пароль, токен от сервера) должны быть получены на старте приложения
// Во время работы приложения в фоне должна выполняться задача планировщика, поддерживающая актуальность токена
// TODO: добавить вкладку профиля пользователя и кнопку выхода из профиля (перебрасывает на страницу авторизации)
//  Created by Andrei Poliakov on 06.06.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation

class SecurityContext {
    private static var INSTANCE : SecurityContext = SecurityContext()
    
    private var token : String?
    private var email : String?
    private var password : String?
    
    func updateToken(token : String) {
        self.token = token
    }
    
    func getPassword() -> String? {
        return password
    }
    
    func getEmail() -> String? {
        return password
    }
    
    func setUserData(_ email : String?, _ password : String?) {
        self.email = email
        self.password = password
    }
    
    private init() {
        
    }
    
    static func instance() -> SecurityContext {
        return INSTANCE;
    }
}
