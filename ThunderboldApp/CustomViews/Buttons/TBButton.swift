//
//  TBButton.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBButton: UIButton {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setTitle("Get Started", for: .normal)
        backgroundColor = UIColor(named: "AccentColor")
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
