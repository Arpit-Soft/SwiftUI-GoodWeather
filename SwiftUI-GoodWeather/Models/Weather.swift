//
//  Weather.swift
//  SwiftUI-GoodWeather
//
//  Created by Arpit Dixit on 23/06/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather?
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
