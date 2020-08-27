//
//  TournamentTableViewCell.swift
//  Sports
//
//  Created by Даниил Марусенко on 25.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class TournamentTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var championshipLabel: UILabel!
    @IBOutlet private var containerView: UIView!
    @IBOutlet weak var championshipImage: UIImageView!
    
    let manageUI = ManageUI()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        manageUI.manageContainerView(containerView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(_ urlString: String) {
        let url = URL(string: urlString)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Create the image object
                let image = UIImage(data: data!)
                
                //Set the ImageView
                DispatchQueue.main.async {
                    self.championshipImage.image = image
                }
                
            }
        }
        task.resume()
    }
    
}
