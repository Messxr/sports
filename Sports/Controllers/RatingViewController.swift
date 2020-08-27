//
//  RatingViewController.swift
//  Sports
//
//  Created by Даниил Марусенко on 24.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sportName: String?
    let dataManager = DataManager()
    var raitingArray = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: K.ratingCell, bundle: nil), forCellReuseIdentifier: K.ratingId)
        
        if let sportName = sportName {
            
            if sportName == "Футбол" {
                if let array = dataManager.getData(forName: "SoccerPlayerRating") {
                    raitingArray = array
                }
            } else if sportName == "Баскетбол" {
                if let array = dataManager.getData(forName: "BasketballPlayerRating") {
                    raitingArray = array
                }
            } else if sportName == "Тенис" {
                if let array = dataManager.getData(forName: "TenisPlayerRating") {
                    raitingArray = array
                }
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Рейтинг звезд"
    }

}

//MARK: - UITableViewDataSource

extension RatingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return raitingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ratingId, for: indexPath) as! RatingTableViewCell
        cell.setImage(raitingArray[indexPath.row][1])
        cell.nameLabel.text = raitingArray[indexPath.row][0]
        cell.countryLabel.text = "Страна: \(raitingArray[indexPath.row][2])"
        cell.ageLabel.text = "Возраст: \(raitingArray[indexPath.row][3])"
        cell.heightLabel.text = "Рост: \(raitingArray[indexPath.row][4])"
        return cell
    }
    
}
