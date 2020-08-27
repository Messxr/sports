//
//  WelcomeViewController.swift
//  Sports
//
//  Created by Даниил Марусенко on 25.08.2020.
//  Copyright © 2020 Daniil Marusenko. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }

    private func configure() {
        // set up scrollview
        
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["Добро пожаловать!", "Обучение", "Рейтинг звезд", "Турниры", "Галерея"]
        let subtitles = ["Для начала Вам нужно выбрать интересующий Вас вид спорт",
                         "Здесь Вы найдете обучающие статьи и видео",
                         "Посмотрите топ лучших спортсменов",
                         "Узнаете об близжайших турнирах, матчах, соревнованиях и прочих мероприятиях",
                         "Увидите красочные фотографии интересных моментов"]
        
        for x in 0..<5 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            // Title, subtitle, image, button
            if x == 0 {
                let label = UILabel(frame: CGRect(x: 10, y: 0, width: pageView.frame.size.width - 20, height: 85))
                let subtitle = UILabel(frame: CGRect(x: 10, y: 50, width: pageView.frame.size.width - 15, height: 70))
                
                setTitle(label: label, titles: titles, index: x)
                pageView.addSubview(label)
                
                setSubtitle(subtitle: subtitle, subtitles: subtitles, index: x)
                pageView.addSubview(subtitle)
            } else if x == 1 || x == 2 {
                let label = UILabel(frame: CGRect(x: 10, y: 0, width: pageView.frame.size.width - 20, height: 87))
                let subtitle = UILabel(frame: CGRect(x: 10, y: 50, width: pageView.frame.size.width - 15, height: 70))
                
                setTitle(label: label, titles: titles, index: x)
                pageView.addSubview(label)
                
                setSubtitle(subtitle: subtitle, subtitles: subtitles, index: x)
                pageView.addSubview(subtitle)
            } else if x == 3 {
                let label = UILabel(frame: CGRect(x: 10, y: 0, width: pageView.frame.size.width - 20, height: 55))
                let subtitle = UILabel(frame: CGRect(x: 10, y: 45, width: pageView.frame.size.width - 15, height: 70))
                
                setTitle(label: label, titles: titles, index: x)
                pageView.addSubview(label)
                
                setSubtitle(subtitle: subtitle, subtitles: subtitles, index: x)
                pageView.addSubview(subtitle)
            } else {
                let label = UILabel(frame: CGRect(x: 10, y: 0, width: pageView.frame.size.width - 20, height: 80))
                let subtitle = UILabel(frame: CGRect(x: 10, y: 50, width: pageView.frame.size.width - 15, height: 70))
                
                setTitle(label: label, titles: titles, index: x)
                pageView.addSubview(label)
                
                setSubtitle(subtitle: subtitle, subtitles: subtitles, index: x)
                pageView.addSubview(subtitle)
            }
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 120, width: pageView.frame.size.width - 20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width - 20, height: 50))
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "onboarding-\(x+1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            if x == 4 {
                button.setTitle("Get Started", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x + 1
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3, height: 0)
        scrollView.isPagingEnabled = true
        
    }
    
    func setTitle(label: UILabel, titles: [String], index: Int) {
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 32)
        label.text = titles[index]
    }
    
    func setSubtitle(subtitle: UILabel, subtitles: [String], index: Int) {
        subtitle.font = UIFont(name: "Helvetica", size: 20)
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 0
        subtitle.text = subtitles[index]
    }
    
    @objc func didTapButton(_ button : UIButton) {
        guard button.tag < 5 else {
            // dismiss
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        // scroll to next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    
}
