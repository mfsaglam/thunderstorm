//
//  NetworkManager.swift
//  ThunderboldApp
//
//  Created by Fatih Sağlam on 16.09.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let ACCESS_KEY = "de0329703863c43ecfeaf1820817af24"

    private let baseUrl = "http://api.weatherstack.com/current?access_key="
    let decoder = JSONDecoder()
    
    
    func getWeatherInfo(withCityName cityName: String) async throws -> Weather {
        let endpoint = baseUrl + ACCESS_KEY + "&query=\(cityName)"
        
        guard let url = URL(string: endpoint) else {
            throw TBError.invalidCityName
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw TBError.invalidResponse
        }
        
        do {
            return try decoder.decode(Weather.self, from: data)
        } catch {
            print(error)
            throw TBError.invalidData
        }
    }
    
    func getWeatherInfo(withLocation location: String) async throws -> Weather {
        let endpoint = baseUrl + ACCESS_KEY + "&query=\(location)"

        guard let url = URL(string: endpoint) else {
            throw TBError.invalidLocation
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw TBError.invalidResponse
        }

        do {
            return try decoder.decode(Weather.self, from: data)
        } catch {
            throw TBError.invalidData
        }
    }
}