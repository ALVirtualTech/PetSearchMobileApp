//
//  APIRequesting.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 13.05.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

protocol APIRequesting {
    var httpMethod: HTTPMethod { get }
    var requestURL: String { get }
}

extension APIRequesting {
    private var baseURL: String {
        // stub is running on localhost
        return "http://127.0.0.1:8080/"
    }
}

extension APIRequesting {
    
    @discardableResult
    func send(completion: ((_ json: [JSON]) -> Void)?) -> DataRequest? {
        let request = Alamofire.request(baseURL + requestURL, method: httpMethod, parameters: nil, headers: nil)
        request.responseJSON { (response) -> Void in
            self.handleResponse(response, then: { (response) in
                guard case .success (let data) = response , let json = data as? [JSON] else {
                    return
                }
                
                completion?(json)
            })
        }
        
        return request
    }
    
    private func handleResponse(_ dataResponse: DataResponse<Any>, then completion: ((_ response: APIResponse) -> Void)?) {
        
        guard let httpCode = dataResponse.response?.statusCode, httpCode == 200 else {
            print("APIRequesting: Failed to parse JSON")
            completion?(.error(code: nil, message: nil))
            return
        }
        
        guard let response = dataResponse.result.value as? [JSON] else {
            print("APIRequesting: 200 response without data")
            completion?(.error(code: nil, message: nil))
            return
        }
        
        completion?(.success(data: response))
    }
    
}

