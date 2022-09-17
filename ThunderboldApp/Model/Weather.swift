//
//  Weather.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 16.09.2022.
//

import Foundation

struct Weather: Codable {
    var location: Location?
    var current: Current?
}

struct Location: Codable {
    var name: String?
}

struct Current: Codable {
    var temperature: Int?
    var weather_descriptions: [String]?
    var weatherCode: Int?
    var windSpeed: Int?
    var pressure, humidity: Int?
}
