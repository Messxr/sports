//
//  RaitingTableViewCell.swift
//  Sports
//
//  Created by Даниил Марусенко on 25.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet private var containerView: UIView!
    
    var manageUI = ManageUI()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        manageUI.manageContainerView(containerView)
        personImageView.layer.cornerRadius = personImageView.frame.size.width / 2
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
                    self.personImageView.image = image
                }
                
            }
        }
        task.resume()
    }
    
}
