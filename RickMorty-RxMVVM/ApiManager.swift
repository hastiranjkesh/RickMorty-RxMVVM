//
//  ApiManager.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

enum NetworkError: Error {
    case badUrl(urlString: String)
    case nilData
    case decodeFailed(error: String)
}

class ApiManager {
    
    func getData<T: Decodable>(path: String, params: [String: Any]? = nil, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: path) else {
            completion(.failure(.badUrl(urlString: path)))
            return
        }
        AF.request(url) { urlRequest in
            urlRequest.allowsConstrainedNetworkAccess = false
        }.responseJSON(completionHandler: { json in
            guard let data = json.data else {
                completion(.failure(NetworkError.nilData))
                return
            }
            if let urlResponse = json.response, urlResponse.statusCode == 200 {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch let errorMsg {
                    completion(.failure(.decodeFailed(error: errorMsg.localizedDescription)))
                }
            }
        })
    }
}
