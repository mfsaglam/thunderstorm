//
//  TBWeatherVC.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBWeatherVC: UIViewController {
    
    var screenTitle = UILabel()
    var searchIconPadding = UIView()
    var cityTextField = UITextField()
    var magnifyingIcon = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(screenTitle)
        view.addSubview(searchIconPadding)
        view.addSubview(cityTextField)
        searchIconPadding.addSubview(magnifyingIcon)
        
        screenTitle.text = "Search for city"
        screenTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        screenTitle.textAlignment = .center
        
        cityTextField.layer.cornerRadius = 10
        cityTextField.clearButtonMode = .whileEditing
        cityTextField.placeholder = "Search..."
        cityTextField.backgroundColor = .systemBackground
        cityTextField.adjustsFontSizeToFitWidth = true
        
        cityTextField.leftView = searchIconPadding
        cityTextField.leftViewMode = .always
        cityTextField.font = UIFont.preferredFont(forTextStyle: .body)
        cityTextField.textColor = .secondaryLabel
        
        magnifyingIcon.tintColor = .secondaryLabel
        magnifyingIcon.contentMode = .scaleAspectFit
        magnifyingIcon.image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        searchIconPadding.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 30),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cityTextField.heightAnchor.constraint(equalToConstant: 50),
            
            magnifyingIcon.topAnchor.constraint(equalTo: searchIconPadding.topAnchor, constant: 20),
            magnifyingIcon.leadingAnchor.constraint(equalTo: searchIconPadding.leadingAnchor, constant: 30),
            magnifyingIcon.bottomAnchor.constraint(equalTo: searchIconPadding.bottomAnchor, constant: -20),
            magnifyingIcon.trailingAnchor.constraint(equalTo: searchIconPadding.trailingAnchor, constant: -20)
        ])
    }

}
