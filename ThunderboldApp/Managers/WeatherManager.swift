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
                return Images.sunny
            } else if weatherCode == 116 {
                return Images.partlyCloudy
            } else if (119...122).contains(weatherCode) {
                return Images.cloudy
            } else if weatherCode == 143 {
                return Images.cloudy
            } else if (176...305).contains(weatherCode) {
                return Images.rainy
            } else if weatherCode == 308 {
                return Images.thunderstorm
            } else if (311...395).contains(weatherCode) {
                return Images.cloudy
            } else {
                return Images.partlyCloudy
            }
        }
        return nil
    }
}
