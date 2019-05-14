//
//  APIResponse.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 14.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//
enum APIResponse {
    case success (data: Any?)
    case error (code: Int?, message: String?)
}
