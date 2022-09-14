//
//  TBWeatherInfoView.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

enum weatherInfoType {
    case precipaion, wind, humidity, pressure
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
    
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(dataLabel)
        
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        titleLabel.textColor = .secondaryLabel
        
        dataLabel.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        titleLabel.textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    

}
