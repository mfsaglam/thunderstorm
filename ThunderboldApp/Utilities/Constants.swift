//
//  Constants.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 19.09.2022.
//

import UIKit

enum Images {
    static let sunny = UIImage(named: "sunnyglass")
    static let partlyCloudy = UIImage(named: "partlycloudyglass")
    static let cloudy = UIImage(named: "cloudyglass")
    static let rainy = UIImage(systemName: "rainyglass")
    static let thunderstorm = UIImage(named: "thunderstormglass")
}

enum SFSymbols {
    static let magnifyingGlass = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
    static let location = UIImage(systemName: "location.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .light))
}

enum Symbols {
    static let celcius = " °c"
    static let percentage = " %"
    static let kilometersPerHour = " km/h"
    static let hectopascalPresure = "hPa"
    static let notApplicable = "N/A"
}

enum Labels {
    static let mostly = "Mostly"
    static let wind = "Wind"
    static let humidity = "Humidity"
    static let pressure = "Pressure"
    static let searchbarPlaceholder = "Search..."
    static let onboardingButtonLabel = "Get Started"
    static let title = "Search for city"
    static let previously = "Previously..."
    
    static let onboardingTitle = "Find your weather predictions in your City"
    static let onboardingMessage = "Easy steps to predict the weather and make your day easier"
    
    static let defaultAlertTitle = "Something went wrong"
    static let alertButton = "OK"
    static let emptyCityNameAlert = "Please enter a city name"
}

enum Colors {
    static let accentColor = UIColor(named: "AccentColor")
    static let mainBackgroundColor = UIColor(named: "mainBackgroundColor")
}

