//
//  WeatherService.swift
//  SwiftUI-GoodWeather
//
//  Created by Arpit Dixit on 23/06/21.
//

import Foundation

enum NetworkError: Error {
    case noInternet
    case domainError
    case decodingError
    case badUrl
    case somethingWentWrong
}

class WeatherService {
    
    func getWeather(city: String, completion: @escaping(Result<Weather, NetworkError>) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=4e04316d5cb10dd3ecad84f7b4ceb84c&units=imperial") else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                if let weather = weatherResponse.main {
                    completion(.success(weather))
                }
                else {
                    completion(.failure(.somethingWentWrong))
                }
            }
            catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
