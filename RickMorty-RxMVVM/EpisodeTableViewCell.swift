//
//  EpisodeTableViewCell.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/17/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    func setContent(name: String, date: String, code: String) {
        nameLabel.text = name
        dateLabel.text = date
        codeLabel.text = code
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
