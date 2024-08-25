//
//  ForeCastView.swift
//  Sky Track
//
//  Created by eng.omar on 25/08/2024.
//

import SwiftUI

struct ForecastView: View {
    let forecastDays: [Forecastday]?
    let getDayName: (Int) -> String

    var body: some View {
        VStack(alignment: .leading, spacing: -10) {
            Text("3-DAY FORECAST")
                .font(.headline)
                .padding(.leading, 40)

            List(0..<3) { index in
                if let forecastDay = forecastDays?[index] {
                    NavigationLink(destination: WeatherDetailView(forecastDay: forecastDay)) {
                        HStack {
                            Text(getDayName(index))
                                .listRowBackground(Color.clear)

                            Spacer()

                            Text("\(forecastDay.day.maxwindKph, specifier: "%.1f") mph")
                            Text("-")
                            Text("\(forecastDay.day.maxwindMph, specifier: "%.1f") kph")
                        }
                        .listRowBackground(Color.clear)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

//#Preview {
//    ForecastView(forecastDays: nil, getDayName: nil)
//}
