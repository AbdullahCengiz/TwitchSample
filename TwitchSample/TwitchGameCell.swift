//
//  TwitchGameCell.swift
//  TwitchSample
//
//  Created by abdullah cengiz on 01/12/15.
//  Copyright © 2015 abdullah cengiz. All rights reserved.
//

import Foundation
import UIKit
import SGImageCache

class TwitchGameCell: UITableViewCell {

    @IBOutlet var gameImageView: SGImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var viewsLabel: UILabel!
    @IBOutlet var channelsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setValues(currentGame:Game){

    }
}

