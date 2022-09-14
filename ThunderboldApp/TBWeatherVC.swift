//
//  TBWeatherVC.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBWeatherVC: UIViewController {
    
    var screenTitle = UILabel()
    var cityTextField = TBTextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createDismissKeyboardTapGesture()
    }
    
    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture )
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(screenTitle)
        view.addSubview(cityTextField)
        
        screenTitle.text = "Search for city"
        screenTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        screenTitle.textAlignment = .center
        
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 30),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cityTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
