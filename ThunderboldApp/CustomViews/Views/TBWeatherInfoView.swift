//
//  TBWeatherInfoView.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

enum WeatherInfoType {
    case mostly, wind, humidity, pressure
}

class TBWeatherInfoView: UIView {

    let titleLabel = UILabel()
    let dataLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(type: WeatherInfoType, with info: String) {
        switch type {
        case .mostly:
            titleLabel.text = Labels.mostly
        case .wind:
            titleLabel.text = Labels.wind
        case .humidity:
            titleLabel.text = Labels.humidity
        case .pressure:
            titleLabel.text = Labels.pressure
        }
    
        dataLabel.text = "\(info)"
    }
    
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(dataLabel)
        
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .center
        
        dataLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        dataLabel.textColor = .label
        dataLabel.textAlignment = .center
        dataLabel.adjustsFontSizeToFitWidth = true
        
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            dataLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dataLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dataLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
