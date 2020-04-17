//
//  EpisodeModel.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import Foundation

struct EpisodeList: Decodable {
    let info: EpisodeInfo
    let results: [Episode]
}


struct EpisodeInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}


struct Episode: Decodable {
    let id: Int
    let name: String
    let date: String
    let episode: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "air_date"
        case id, name, episode
    }
}
