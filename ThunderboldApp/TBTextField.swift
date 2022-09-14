//
//  TBTextField.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 14.09.2022.
//

import UIKit

class TBTextField: UITextField {
    
    var searchIconPadding = UIView()
    var magnifyingIcon = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        searchIconPadding.addSubview(magnifyingIcon)
        magnifyingIcon.tintColor = .secondaryLabel
        magnifyingIcon.contentMode = .scaleAspectFit
        magnifyingIcon.image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    
        layer.cornerRadius = 8
        clearButtonMode = .whileEditing
        placeholder = "Search..."
        backgroundColor = .systemBackground
        adjustsFontSizeToFitWidth = true
        leftView = searchIconPadding
        leftViewMode = .always
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .secondaryLabel
        keyboardType = .default
        returnKeyType = .go
        
        magnifyingIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIconPadding.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            magnifyingIcon.topAnchor.constraint(equalTo: searchIconPadding.topAnchor, constant: 20),
            magnifyingIcon.leadingAnchor.constraint(equalTo: searchIconPadding.leadingAnchor, constant: 30),
            magnifyingIcon.bottomAnchor.constraint(equalTo: searchIconPadding.bottomAnchor, constant: -20),
            magnifyingIcon.trailingAnchor.constraint(equalTo: searchIconPadding.trailingAnchor, constant: -20)
        ])
    }

}
