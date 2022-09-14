//
//  ViewController.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var sunnyImage = UIImageView()
    var button = UIButton()
    var label = UILabel()
    var subtitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        view.addSubview(sunnyImage)
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(subtitle)
        view.backgroundColor = UIColor(named: "mainBackgroundColor")

        label.text = "Find your weather predictions in your City"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        subtitle.text = "Easy steps to predict the weather and make your day easier"
        subtitle.font = UIFont.systemFont(ofSize: 17)
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
        subtitle.textColor = .secondaryLabel
        
        
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = UIColor(named: "AccentColor")
        button.layer.cornerRadius = 10
        
        sunnyImage.image = UIImage(named: "sunnyglass")
        sunnyImage.contentMode = .scaleAspectFit
        
        label.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        sunnyImage.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunnyImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            sunnyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            sunnyImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sunnyImage.heightAnchor.constraint(equalToConstant: 300),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -150),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            subtitle.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }


}

