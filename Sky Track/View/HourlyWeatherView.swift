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
            if ((viewModel.weatherData?.current?.isDay) != nil) {
                Image("day_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }else {
                Image("night_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
               
            
            VStack {
                Text(viewModel.weatherData?.location?.name ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("\(viewModel.weatherData?.current?.tempC ?? 0, specifier: "%.1f")°")
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(viewModel.weatherData?.current?.condition?.text ?? "")
                    .font(.title2)
                    .foregroundColor(.black)
                HStack(alignment: .center) {
                    Text("H:\(viewModel.weatherData?.current?.tempC ?? 0, specifier: "%.1f")°")
                    Text("L:\(viewModel.weatherData?.current?.tempF ?? 0, specifier: "%.1f")°")
                }
                .foregroundColor(.black)
                
                Spacer()
                List(0..<3) { index in
                    if let forecastDay = viewModel.weatherData?.forecast?.forecastday?[index] {
                        HStack {
                            Text(viewModel.getDayName(for: index))
                                .listRowBackground(Color.clear)
                            
                            // Accessing windMPH from the Day object inside forecastDay
                            Text("\((forecastDay.day?.maxwindMPH ?? 0), specifier: "%.1f") mph")
                            Text("-")
                            Text("\((forecastDay.day?.maxwindKPH ?? 0), specifier: "%.1f") kph")
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .scrollContentBackground(.hidden)

                HStack {
                    VStack(alignment: .leading) {
                        ForEach(0..<3) { day in
                            HStack {
                                Text(viewModel.getDayName(for: day))
                                Spacer()
                                Text("\(viewModel.weatherData?.current?.tempC ?? 0, specifier: "%.1f")°")
                            }
                        }
                    }
                    .foregroundColor(.white)

                }
                .padding()
                
                Spacer()
                
                // بيانات إضافية
                HStack {
                    VStack {
                        Text("Visibility")
                        Text("\(viewModel.weatherData?.current?.visKM ?? 0) km")
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("Humidity")
                        Text("\(viewModel.weatherData?.current?.humidity ?? 0)%")
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("Pressure")
                        Text("\(viewModel.weatherData?.current?.pressureMB ?? 0) mb")
                    }
                    .foregroundColor(.white)
                }
                .padding()
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchWeather()
        }
    }
}

//
#Preview {
    WeatherView()
}
