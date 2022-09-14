//
//  TBWeatherCardView.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBWeatherCardView: UIView {
    
    var frameView = UIView()
    var cityName = UILabel()
    var degrees = UILabel()
    var weatherIcon = UIImageView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        addSubview(frameView)
        addSubview(cityName)
        addSubview(degrees)
        addSubview(weatherIcon)
        
        frameView.translatesAutoresizingMaskIntoConstraints = false
    }

}
