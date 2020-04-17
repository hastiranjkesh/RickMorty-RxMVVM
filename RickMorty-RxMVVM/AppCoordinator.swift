//
//  AppCoordinator.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    
    func createEpisodesViewController() -> EpisodesViewController {
        let episodesVM = EpisodesViewModel(remoteRepository: RemoteRepository(apiManager: ApiManager()))
        let episodesVC = EpisodesViewController(viewModel: episodesVM)
        return episodesVC
    }
}
