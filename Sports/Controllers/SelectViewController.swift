//
//  SelectViewController.swift
//  Sports
//
//  Created by Даниил Марусенко on 24.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sportNamesArray = ["Футбол", "Баскетбол", "Тенис", "Хоккей", "Бокс", "Регби", "Волейбол", "Гольф"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            // show onboarding
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        
        tableView.register(UINib(nibName: K.sportsCell, bundle: nil), forCellReuseIdentifier: K.sportsId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }

}

//MARK: - UITableViewDataSource

extension SelectViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.sportsId, for: indexPath) as! SportsTableViewCell
        cell.sportLabel.text = sportNamesArray[indexPath.row]
        cell.sportImageView.image = UIImage(named: "sport-\(indexPath.row + 1)")
        return cell
    }
    
}


//MARK: - UITableViewDelegate

extension SelectViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.selectSegueId {
            
            let backItem = UIBarButtonItem()
            backItem.title = sportNamesArray[index]
            navigationItem.backBarButtonItem = backItem
            
            let barViewControllers = segue.destination as! UITabBarController
            
            let tutorialVC = barViewControllers.viewControllers![0] as! TutorialViewController
            tutorialVC.sportName = sportNamesArray[index]
            let raitingVC = barViewControllers.viewControllers![1] as! RatingViewController
            raitingVC.sportName = sportNamesArray[index]
            let tournamentsVC = barViewControllers.viewControllers![2] as! TournamentsViewController
            tournamentsVC.sportName = sportNamesArray[index]
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: K.selectSegueId, sender: self)
    }
    
}

//MARK: - Core

class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    ///
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
