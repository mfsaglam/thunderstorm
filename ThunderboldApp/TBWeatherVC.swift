//
//  TBWeatherVC.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBWeatherVC: UIViewController {
    
    var weather: Weather?
    var screenTitle = UILabel()
    var locationButton = UIButton()
    var cityTextField = TBTextField()
    var weatherCardView = TBWeatherCardView()
    
    var isCityNameEntered: Bool {
        return !cityTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureUI()
        createDismissKeyboardTapGesture()
    }
    
    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture )
    }
    
    private func updateData(with weather: Weather) {
        weatherCardView.updateDataOnMainThread(with: weather)
    }
    
    private func configureDelegates() {
        cityTextField.delegate = self
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(screenTitle)
        view.addSubview(locationButton)
        view.addSubview(cityTextField)
        view.addSubview(weatherCardView)
        
        screenTitle.text = "Search for city"
        screenTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        screenTitle.textAlignment = .center
        
        let locationButtonConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light)
        locationButton.setImage(UIImage(systemName: "location.circle", withConfiguration: locationButtonConfig), for: .normal)
        locationButton.addTarget(self, action: #selector(locationTapped), for: .touchUpInside)
    
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationButton.centerYAnchor.constraint(equalTo: screenTitle.centerYAnchor),
            locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationButton.heightAnchor.constraint(equalToConstant: 50),
            locationButton.widthAnchor.constraint(equalToConstant: 50),
            
            cityTextField.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 30),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cityTextField.heightAnchor.constraint(equalToConstant: 50),
            
            weatherCardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            weatherCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weatherCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weatherCardView.heightAnchor.constraint(equalToConstant: 330)
        ])
    }
    
    @objc private func locationTapped() {
        //get current location and get weather data
    }

}

extension TBWeatherVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard isCityNameEntered else {
            //present alert
            return false
        }
        Task {
            do {
                let weather = try await NetworkManager.shared.getWeatherInfo(withCityName: cityTextField.text!)
                self.weather = weather
                updateData(with: weather)
            } catch {
                if let tbError = error as? TBError {
                    //present alert here
                    print(tbError.rawValue)
                } else {
                    //
                }
            }
        }
        cityTextField.resignFirstResponder()
        return true
    }
}
