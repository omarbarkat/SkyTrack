//
//  CurrentWeather.swift
//  Sky Track
//
//  Created by eng.omar on 25/08/2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    let locationName: String
    let tempC: Double
    let conditionText: String
    let conditionIcon: URL?
    let h:Double
    let l: Double

    var body: some View {
        VStack {
            Text(locationName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)

            Text("\(tempC, specifier: "%.1f")°")
                .font(.system(size: 64))
                .fontWeight(.bold)
                .foregroundColor(.black)

            Text(conditionText)
                .foregroundColor(.black)

            if let iconURL = conditionIcon {
                AsyncImage(url: iconURL) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            }
            HStack(alignment: .center) {
                Text("H:\(h, specifier: "%.1f")°")
                Text("L:\(l, specifier: "%.1f")°")
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    CurrentWeatherView(locationName: "cairo", tempC: 23 ,conditionText: "clear", conditionIcon: nil, h: 23, l: 25)
}
