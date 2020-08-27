//
//  TournamentsViewController.swift
//  Sports
//
//  Created by Даниил Марусенко on 24.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class TournamentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sportName: String?
    let dataManager = DataManager()
    var eventsArray = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.tournamentsCell, bundle: nil), forCellReuseIdentifier: K.tournamentsId)

        if sportName == "Футбол" {
            if let eventsData = dataManager.getData(forName: "SoccerEventsData") {
                eventsArray = eventsData
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Турниры"
    }

}


//MARK: - UITableViewDataSource

extension TournamentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tournamentsId, for: indexPath) as! TournamentTableViewCell
        cell.championshipLabel.text = eventsArray[indexPath.row][0]
        cell.setImage(eventsArray[indexPath.row][1])
        cell.dateLabel.text = eventsArray[indexPath.row][2]
        cell.participantsLabel.text = "\(eventsArray[indexPath.row][3]) - \(eventsArray[indexPath.row][4])"
        return cell
    }
    
}

