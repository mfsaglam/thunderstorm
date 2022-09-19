//
//  WeatherManager.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 17.09.2022.
//

import UIKit

struct WeatherManager {
    
    func getConditionImage(weatherCode: Int?) -> UIImage? {
        if let weatherCode = weatherCode {
            if weatherCode == 113 {
                return UIImage(named: "sunnyglass")
            } else if weatherCode == 116 {
                return UIImage(named: "partlycloudyglass")
            } else if (119...122).contains(weatherCode) {
                return UIImage(named: "cloudyglass")
            } else if (176...305).contains(weatherCode) {
                return UIImage(named: "sunnyglass")
            } else if weatherCode == 308 {
                return UIImage(named: "thunderstormglass")
            } else if (311...395).contains(weatherCode) {
                return UIImage(named: "cloudyglass")
            } else {
                return UIImage(named: "partlycloudyglass")
            }
        }
        return nil
    }
}
