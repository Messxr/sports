//
//  TutorialTableViewCell.swift
//  Sports
//
//  Created by Даниил Марусенко on 26.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import youtube_ios_player_helper
import UIKit

class TutorialTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet private var containerView: UIView!
    @IBOutlet var playerView: YTPlayerView!
    
    let manageUI = ManageUI()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        manageUI.manageContainerView(containerView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
