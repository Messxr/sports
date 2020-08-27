//
//  IntercomViewController.swift
//  Sports
//
//  Created by Даниил Марусенко on 24.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit
import StoreKit
import MessageUI

class IntercomViewController: UIViewController {

    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var problemButton: UIButton!
    
    var manageUI = ManageUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateButton(contactUsButton)
        updateButton(rateButton)
        updateButton(problemButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Поддержка"
    }
    
    @IBAction func rateButtonPressed(_ sender: UIButton) {
        rateApp()
    }
    
    @IBAction func contactPressed(_ sender: UIButton) {
        showMailComposer()
    }
    
    func updateButton(_ button: UIButton) {
        button.frame.size.height = 48
        button.frame.size.width = 303
        button.layer.cornerRadius = 24
        button.backgroundColor = manageUI.hexStringToUIColor(hex: "#345A99")
        button.setTitleColor(.white, for: .normal)
        
        manageUI.manageContainerView(button)
    }
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()

        } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "appId") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)

            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            print("Device can't send mail")
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["support@gmail.com"])
        composer.setSubject("Help!")
        
        present(composer, animated: true)
    }
    
}

//MARK: - MFMailComposeViewControllerDelegate

extension IntercomViewController: MFMailComposeViewControllerDelegate {
    
}
