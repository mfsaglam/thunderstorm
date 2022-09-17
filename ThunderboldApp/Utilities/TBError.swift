//
//  TBError.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 16.09.2022.
//

import Foundation

enum TBError: String, Error {
    case invalidCityName = "You've entered an invalid city. Please check it and try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invalidLocation = "The location was invalid, please try again."
}
