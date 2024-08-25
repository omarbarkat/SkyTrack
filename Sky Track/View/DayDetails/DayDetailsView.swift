//
//  DayDetailsView.swift
//  Sky Track
//
//  Created by eng.omar on 25/08/2024.
//

import SwiftUI

struct WeatherDetailView: View {
    var forecastDay: Forecastday? 
    var viewModel = DayDetailsViewModel()

    var body: some View {
        VStack(alignment: .leading) {
                 Text("Hourly Forecast")
                     .font(.largeTitle)
                     .fontWeight(.bold)
                     .padding()
                 
                 List(0..<6) { index in
                     if let hour = forecastDay!.hour[safe: index] { 
                         
                         HStack {
                             Text( ((viewModel.convertToTimeOnly(dateString: hour.time!)) ))
                                 .bold()
                             Spacer()
                             
                        if let iconURL = URL(string: "https:" + (hour.condition.icon.rawValue)) {
                             AsyncImage(url: iconURL)
                                 .frame(width: 32, height: 32)
                         }
                             Spacer()
                             Text(hour.tempC.description)
                                 .bold()
                             Spacer()
                         }
                         .padding()
                     }
                 }
             }
             .navigationTitle("6-Hour Forecast")
    }


}

#Preview {
    WeatherDetailView()
}
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
