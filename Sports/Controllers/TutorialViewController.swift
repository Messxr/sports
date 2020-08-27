//
//  TutorialViewController.swift
//  Sports
//
//  Created by Даниил Марусенко on 26.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sportName: String?
    let dataManager = DataManager()
    var tutorialsArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sportName == "Футбол" {
            if let array = dataManager.getData(forName: "SoccerTutorials") {
                tutorialsArray = array
            }
        }

        tableView.dataSource = self
        tableView.register(UINib(nibName: K.tutorialCell, bundle: nil), forCellReuseIdentifier: K.tutorialId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Обучение"
    }

}


//MARK: - UITableViewDataSource

extension TutorialViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorialsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tutorialId, for: indexPath) as! TutorialTableViewCell
        cell.playerView.load(withVideoId: tutorialsArray[indexPath.row][0], playerVars: ["playsinline": 1])
        cell.titleLabel.text = tutorialsArray[indexPath.row][1]
        cell.articleLabel.text = tutorialsArray[indexPath.row][2]
        return cell
    }
    
}
