//
//  TBWeatherCardView.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBWeatherCardView: UIView {
    
    var cityName = UILabel()
    var degrees = UILabel()
    var weatherIcon = UIImageView()
    var mostly = TBWeatherInfoView()
    var humidity = TBWeatherInfoView()
    var wind = TBWeatherInfoView()
    var pressure = TBWeatherInfoView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        addSubview(cityName)
        addSubview(degrees)
        addSubview(weatherIcon)
        
        addSubview(mostly)
        addSubview(humidity)
        addSubview(wind)
        addSubview(pressure)
        
        layer.cornerRadius = 40
        backgroundColor = .systemBackground
        
        cityName.text = "San Francisco"
        cityName.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        cityName.adjustsFontSizeToFitWidth = true
        
        degrees.text = "32 °c"
        degrees.adjustsFontSizeToFitWidth = true
        degrees.textAlignment = .center
        degrees.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        
        weatherIcon.image = UIImage(named: "sunnyglass")
        weatherIcon.contentMode = .scaleAspectFit
        
        mostly.set(type: .mostly, with: "Sunny")
        
        cityName.translatesAutoresizingMaskIntoConstraints = false
        degrees.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            cityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            cityName.widthAnchor.constraint(equalToConstant: 150),
            
            degrees.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 16),
            degrees.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            degrees.trailingAnchor.constraint(equalTo: weatherIcon.leadingAnchor, constant: -20),
            
            weatherIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            weatherIcon.leadingAnchor.constraint(equalTo: degrees.trailingAnchor, constant: 20),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100),
            
            mostly.topAnchor.constraint(equalTo: degrees.bottomAnchor, constant: 20),
            mostly.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }

}
