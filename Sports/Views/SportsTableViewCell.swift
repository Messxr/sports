//
//  SportsTableViewCell.swift
//  Sports
//
//  Created by Даниил Марусенко on 24.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var sportImageView: UIImageView!
    @IBOutlet private var containerView: UIView!
    
    var manageUI = ManageUI()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        manageUI.manageContainerView(containerView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
