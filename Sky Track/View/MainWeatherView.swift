////
////  MainWeatherView.swift
////  Sky Track
////
////  Created by eng.omar on 22/08/2024.
////
//
//import SwiftUI
//
//struct MainWeatherView: View {
//    @StateObject var viewModel = WeatherViewModel()
//
//    var body: some View {
//        VStack {
//            if let weather = viewModel.weather {
////                Text(weather.name ?? "")
////                    .font(.largeTitle)
////                    .bold()
//
//                Text("\(Int(weather.current.tempC))°")
//                    .font(.system(size: 80))
//                    .bold()
//
////                Text(weather.base ?? "")
////                    .font(.title3)
//                
//                // Background changes based on time of day
//                Spacer()
//            } else {
//                ProgressView("Loading...")
//            }
//        }
//        .background(
//            Image(systemName: "sun.max.fill")
//                .resizable()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                .scaledToFill()
//        )
//        .onAppear {
//            viewModel.getData()
//        }
//    }
//}
//
//#Preview {
//    MainWeatherView()
//}
