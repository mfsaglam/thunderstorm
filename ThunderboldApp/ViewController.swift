//
//  ViewController.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var sunnyImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        view.addSubview(sunnyImage)
        sunnyImage.image = UIImage(named: "sunnyglass")
        sunnyImage.contentMode = .scaleAspectFit
        sunnyImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunnyImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            sunnyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            sunnyImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sunnyImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }


}

