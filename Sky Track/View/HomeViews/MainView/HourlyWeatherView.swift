//
//  HourlyWeatherView.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    var body: some View {
        ZStack {
            BackgroundView(isDay:  ((viewModel.weatherData?.current.isDay) != nil) == true)     
            VStack {
                if let weatherData = viewModel.weatherData {
                               CurrentWeatherView(
                                   locationName: weatherData.location.name,
                                   tempC: weatherData.current.tempC,
                                   conditionText: weatherData.current.condition.text.rawValue,
                                   conditionIcon: URL(string: "https:" + weatherData.current.condition.icon.rawValue),
                                   h: weatherData.current.tempC,
                                   l: weatherData.current.tempF
                                   
                               )
                    
                               
                               ForecastView(
                                   forecastDays: weatherData.forecast.forecastday,
                                   getDayName: viewModel.getDayName(for:)
                               )
                               
                               WeatherDetailsView(
                                visibilityKM: Double(weatherData.current.visKM),
                                   humidity: weatherData.current.humidity,
                                pressureMB: Double(weatherData.current.pressureMB),
                                   feelsLikeC: weatherData.current.feelslikeC
                               )
                           }
                       }
                       .padding(.bottom)
                   }
                   .onAppear {
                       viewModel.fetchWeather()
                   }
               }
           }
#Preview {
    NavigationView {
        WeatherView()

    }
}
