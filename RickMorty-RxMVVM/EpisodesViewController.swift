//
//  EpisodesViewController.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class EpisodesViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel: EpisodesViewModel
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "EpisodeTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeTableViewCell")
        rxBinding()
        viewModel.getEpisodes()
    }
    
    init(viewModel: EpisodesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "EpisodesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func rxBinding() {
        viewModel.loading.bind(to: activityIndicator.rx.isAnimating).disposed(by: disposeBag)
        viewModel.error.observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                if error {
                    //Show error message
                }
            }).disposed(by: disposeBag)
        
        viewModel.episodes.observeOn(MainScheduler.instance)
            .subscribe(onNext: { episodes in
                
            }).disposed(by: disposeBag)
        
        viewModel.episodes.bind(to: tableView.rx.items(cellIdentifier: "EpisodeTableViewCell", cellType: EpisodeTableViewCell.self)) {(row, episode, cell) in
            cell.setContent(name: episode.name, date: episode.date, code: episode.episode)
        }.disposed(by: disposeBag)
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance).subscribe(onNext: { [weak self] query in
                guard let self = self else { return }
                self.viewModel.search(query: query)
            }).disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDelegate
extension EpisodesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
