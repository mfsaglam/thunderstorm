//
//  TBWeatherVC.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit
import CoreLocation

class TBWeatherVC: UIViewController {
    
    let locationManager = CLLocationManager()
    
    var weather: Weather?
    var screenTitle = UILabel()
    var locationButton = UIButton()
    var cityTextField = TBTextField()
    var weatherCardView = TBWeatherCardView()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var textFieldShouldBecomeFirstResponder = true
    var previousCityNames = [String]()
    
    var isCityNameEntered: Bool {
        return !cityTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureLocationManager()
        configureUI()
        createDismissKeyboardTapGesture()
        startUpdatingLocation()
    }
    
    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture )
    }
    
    private func updateData(with weather: Weather) {
        if let name = weather.location?.name {
            addCityNameToPreviousSearches(name)
        }
        cityTextField.text = ""
        weatherCardView.updateDataOnMainThread(with: weather)
    }
    
    private func requestWeatherData(requestType: RequestType, query: String) {
        showLoadingView()
        Task {
            switch requestType {
            case .cityName:
                do {
                    let weather = try await NetworkManager.shared.getWeatherInfo(withCityName: query)
                    self.weather = weather
                    dismissLoadingView()
                    updateData(with: weather)
                } catch {
                    dismissLoadingView()
                    if let tbError = error as? TBError {
                        let alert = UIAlertController(title: "Something went wrong", message: tbError.rawValue, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                        present(alert, animated: true)
                    } else {
                        let alert = UIAlertController(title: "Something went wrong", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                        present(alert, animated: true)
                    }
                }
            case .location:
                do {
                    let weather = try await NetworkManager.shared.getWeatherInfo(withLocation: query)
                    self.weather = weather
                    dismissLoadingView()
                    updateData(with: weather)
                } catch {
                    dismissLoadingView()
                    if let tbError = error as? TBError {
                        let alert = UIAlertController(title: "Something went wrong", message: tbError.rawValue, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                        present(alert, animated: true)
                    } else {
                        let alert = UIAlertController(title: "Something went wrong", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                        present(alert, animated: true)
                    }
                }
            }
        }
    }
    
    private func addCityNameToPreviousSearches(_ city: String) {
        if previousCityNames.count < 5 && !previousCityNames.contains(city) && !city.isEmpty {
            previousCityNames.append(city)

        } else {
            previousCityNames.removeFirst()
            previousCityNames.append(city)
        }
    }
    
    @objc private func locationTapped() {
        cityTextField.resignFirstResponder()
        startUpdatingLocation()
    }
    
    func showLoadingView() {
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.activityIndicator.removeFromSuperview()
        }
    }
    
    //MARK: - Configuration
    
    private func configureDelegates() {
        cityTextField.delegate = self
        locationManager.delegate = self
    }
    
    private func configureLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
    }
    
    private func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
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
            
            weatherCardView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            weatherCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weatherCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weatherCardView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

//MARK: - UITextField Delegate

extension TBWeatherVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard isCityNameEntered else {
            let alert = UIAlertController(title: "Something went wrong", message: "Please enter a city name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
            return false
        }
        let query = cityTextField.text!.replacingOccurrences(of: " ", with: "%20")
        requestWeatherData(requestType: .cityName, query: query)
        cityTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textFieldShouldBecomeFirstResponder {
            textFieldShouldBecomeFirstResponder = false
            return true
        }
        if previousCityNames.count == 0 {
            return true
        } else {
            let actionSheet = UIAlertController(title: "", message: "Previously...", preferredStyle: .actionSheet)
            for cityName in previousCityNames {
                actionSheet.addAction(UIAlertAction(title: cityName, style: .default, handler: { [weak self] action in
                    guard let self = self else { return }
                    let query = action.title?.replacingOccurrences(of: " ", with: "%20")
                    self.requestWeatherData(requestType: .cityName, query: query ?? "")
                }))
            }
            actionSheet.addAction(UIAlertAction(title: "Custom...", style: .cancel, handler: { [weak self] _ in
                guard let self = self else { return }
                self.textFieldShouldBecomeFirstResponder = true
                self.cityTextField.becomeFirstResponder()
            }))
            present(actionSheet, animated: true)
            return false
        }
    }
}

extension TBWeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let query = "\(locValue.latitude),\(locValue.longitude)"
        requestWeatherData(requestType: .location, query: query)
        locationManager.stopUpdatingLocation()
    }
}
