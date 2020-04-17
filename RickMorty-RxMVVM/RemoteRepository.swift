//
//  RemoteRepository.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import Foundation

final class RemoteRepository {
    
    var apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getEpisodes(path: String, completion: @escaping (Result<EpisodeList,NetworkError>) -> Void) {
        apiManager.getData(path: path) { (data: Result<EpisodeList,NetworkError>) in
            completion(data)
        }
    }
}
