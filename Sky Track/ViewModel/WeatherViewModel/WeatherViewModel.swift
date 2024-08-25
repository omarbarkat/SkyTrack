//
//  WeatherViewModel.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation


class WeatherViewModel: ObservableObject {
    @Published var weatherData: Weather?
    private let networkService = NetworkService()
    func getDayName(for day: Int) -> String {
          let currentDate = Date()
          let calendar = Calendar.current
          let date = calendar.date(byAdding: .day, value: day, to: currentDate)
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "EEEE" 
          return dateFormatter.string(from: date ?? currentDate)
      }
    func fetchWeather() {
        networkService.getData { [weak self] result in
            DispatchQueue.main.async {
                self?.weatherData = result
            }
        }
    }
}

