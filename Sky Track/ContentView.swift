//
//  ContentView.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()

    var body: some View {
           ZStack {
//               Image(viewModel.background)
//                   .resizable()
//                   .edgesIgnoringSafeArea(.all)
               
               VStack {
                   Text(viewModel.weatherData?.location?.name ?? "Loading...")
                       .font(.largeTitle)
                       .foregroundColor(.black)
                   
//                   Text("\(viewModel.weatherData?.highTemp ?? 0.0)°")
//                       .font(.system(size: 70))
//                       .bold()
//                       .foregroundColor(.black)
//                   
//                   Text(viewModel.weatherData?.condition ?? "...")
//                       .font(.title)
//                       .foregroundColor(.black)
                   
                   // Add other UI components as needed
               }
           }
           .onAppear {
               viewModel.fetchWeather()
           }
       }
          }
//}
//struct ForecastView: View {
//    let forecast: Weather.Forecast
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            ForEach(forecast.forecastday, id: \.date) { day in
//                HStack {
//                    Text(day.date)
//                    Spacer()
//                    Text("\(Int(day.day.maxtemp_c))° / \(Int(day.day.mintemp_c))°")
//                    Image(systemName: "cloud.sun.fill") // يمكنك استخدام الصورة من الـAPI
//                }
//                .padding()
//            }
//        }
//        .background(Color.white.opacity(0.2))
//        .cornerRadius(10)
//        .padding(.horizontal)
//    }
//}

#Preview {
    ContentView()
}
