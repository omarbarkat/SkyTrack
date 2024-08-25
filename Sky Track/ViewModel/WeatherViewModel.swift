//
//  WeatherViewModel.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation


class WeatherViewModel: ObservableObject {
    @Published var weatherData: Weather?
    
    
    
    func getDayName(for day: Int) -> String {
          let currentDate = Date()
          let calendar = Calendar.current
          let date = calendar.date(byAdding: .day, value: day, to: currentDate)
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "EEEE" 
          return dateFormatter.string(from: date ?? currentDate)
      }
    
    func fetchWeather() {
        NetworkService.shared.fetchData(from: BGConstants.baseURL, as: Weather.self) { (result: Result<Weather, NetworkError>) in
            switch result {
            case .success(let data):
                self.weatherData = data
            case .failure(let error):
                print("Failed to fetch weather data: \(error)")
            }
        }
    }
    
    
    
    var background: String {
        if let isDay = weatherData?.current?.isDay {
            return ((isDay ) != 0) ? "day_background" : "night_background"
        }
        return "default_background"
    }
}

