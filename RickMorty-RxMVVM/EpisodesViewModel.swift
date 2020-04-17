//
//  EpisodesViewModel.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import Foundation
import RxSwift

final class EpisodesViewModel {
    
    var remoteRepository: RemoteRepository
    var loading: PublishSubject<Bool> = PublishSubject()
    var error: PublishSubject<Bool> = PublishSubject()
    var episodes: PublishSubject<[Episode]> = PublishSubject()
    
    init(remoteRepository: RemoteRepository) {
        self.remoteRepository = remoteRepository
    }
    
    func getEpisodes() {
        loading.onNext(true)
        remoteRepository.getEpisodes(path: "https://rickandmortyapi.com/api/episode/",
                                     completion: { [weak self] result in
                                        guard let self = self else { return }
                                        self.loading.onNext(false)
                                        switch result {
                                        case .success(let episodesList):
                                            self.episodes.onNext(episodesList.results)
                                        case .failure(let err):
                                            print(err)
                                            self.error.onNext(true)
                                        }
        })
    }
}
