//
//  EpisodesViewController.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import UIKit

final class EpisodesViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel: EpisodesViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init(viewModel: EpisodesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "EpisodesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
