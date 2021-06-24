//
//  WeatherViewModel.swift
//  SwiftUI-GoodWeather
//
//  Created by Arpit Dixit on 24/06/21.
//

import UIKit
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService!
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f",temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        
        if let humidity = self.weather.humidity {
            return String(format: "%.0f",humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
