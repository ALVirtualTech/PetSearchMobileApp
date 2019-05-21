//
//  API.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 14.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Alamofire

struct API {
    struct Pets {
        struct Adverts: APIRequesting {
            var httpMethod: HTTPMethod { return .get }
            var requestURL: String { return "adverts" }
        }
        
        struct Advert: APIRequesting {
            var httpMethod: HTTPMethod { return .get }
            var requestURL: String { return "advert" }
            
            func getParams(_ id : Int) -> JSON {
                return [
                    "id": id
            ]}
        }
        
        struct Users: APIRequesting {
            var httpMethod: HTTPMethod { return .get }
            var requestURL: String { return "users" }
        }
    }
}
