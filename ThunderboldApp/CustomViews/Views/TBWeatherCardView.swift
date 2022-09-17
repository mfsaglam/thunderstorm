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
    var seperator = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDataOnMainThread(with weather: Weather) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cityName.text = weather.location?.name
            self.degrees.text = "\(weather.current?.temperature ?? 0) °c"
            self.mostly.dataLabel.text = weather.current?.weatherDescriptions?.first
            self.humidity.dataLabel.text = "\(weather.current?.humidity ?? 0) %"
            self.wind.dataLabel.text = "\(weather.current?.windSpeed ?? 0) km/h"
            self.pressure.dataLabel.text = "\(weather.current?.pressure ?? 0)hPa"
        }
    }
    
    private func configureUI() {
        addSubview(cityName)
        addSubview(degrees)
        addSubview(weatherIcon)
        addSubview(seperator)
        
        addSubview(mostly)
        addSubview(humidity)
        addSubview(wind)
        addSubview(pressure)
        
        layer.cornerRadius = 40
        backgroundColor = .systemBackground
        
        cityName.text = "San Francisco"
        cityName.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        cityName.textColor = .secondaryLabel
        cityName.textAlignment = .center
        cityName.adjustsFontSizeToFitWidth = true
        
        degrees.text = "32 °c"
        degrees.adjustsFontSizeToFitWidth = true
        degrees.textAlignment = .center
        degrees.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        
        weatherIcon.image = UIImage(named: "sunnyglass")
        weatherIcon.contentMode = .scaleAspectFit
        
        seperator.backgroundColor = .secondaryLabel
        
        mostly.set(type: .mostly, with: "Sunny")
        humidity.set(type: .humidity, with: "NA")
        wind.set(type: .wind, with: "NA")
        pressure.set(type: .pressure, with: "NA")
        
        cityName.translatesAutoresizingMaskIntoConstraints = false
        degrees.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        seperator.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            seperator.centerXAnchor.constraint(equalTo: centerXAnchor),
            seperator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            seperator.widthAnchor.constraint(equalToConstant: 1),
            seperator.heightAnchor.constraint(equalToConstant: 130),
            
            weatherIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: seperator.trailingAnchor),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100),
            
            cityName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cityName.trailingAnchor.constraint(equalTo: seperator.leadingAnchor),
            cityName.heightAnchor.constraint(equalToConstant: 30),
            
            degrees.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 16),
            degrees.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            degrees.trailingAnchor.constraint(equalTo: seperator.leadingAnchor),
            degrees.bottomAnchor.constraint(equalTo: weatherIcon.bottomAnchor),
            
            mostly.topAnchor.constraint(equalTo: degrees.bottomAnchor, constant: 20),
            mostly.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mostly.trailingAnchor.constraint(equalTo: seperator.leadingAnchor, constant: -10),
            
            humidity.topAnchor.constraint(equalTo: mostly.bottomAnchor, constant: 70),
            humidity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            humidity.trailingAnchor.constraint(equalTo: seperator.leadingAnchor, constant: -10),
            
            wind.topAnchor.constraint(equalTo: degrees.bottomAnchor, constant: 20),
            wind.leadingAnchor.constraint(equalTo: seperator.trailingAnchor, constant: 10),
            wind.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            pressure.topAnchor.constraint(equalTo: wind.bottomAnchor, constant: 70),
            pressure.leadingAnchor.constraint(equalTo: seperator.trailingAnchor, constant: 10),
            pressure.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }

}
