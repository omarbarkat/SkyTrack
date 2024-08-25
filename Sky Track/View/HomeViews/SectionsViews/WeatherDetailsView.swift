//
//  WeatherDetailsView.swift
//  Sky Track
//
//  Created by eng.omar on 25/08/2024.
//

import SwiftUI

struct WeatherDetailsView: View {
    let visibilityKM: Double
    let humidity: Int
    let pressureMB: Double
    let feelsLikeC: Double

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack {
                    Text("Visibility")
                        .padding()
                        .font(.title3)
                    Text(String(format: "%.1f km", visibilityKM))
                        .font(.largeTitle)
                }
                .foregroundColor(.black)

                Spacer()

                VStack {
                    Text("Humidity")
                        .padding()
                        .font(.title3)

                    Text("\(humidity)%")
                        .font(.largeTitle)
                }
                .foregroundColor(.black)
            }

            HStack {
                VStack {
                    Text("Pressure")
                        .padding()
                        .font(.title3)
                    Text(String(format: "%.1f km", pressureMB))
                        .font(.largeTitle)
                }
                .foregroundColor(.black)

                Spacer()

                VStack {
                    Text("FEELS LIKE")
                        .padding()
                        .font(.title3)

                    Text(String(format: "%.1f", feelsLikeC))
                        .font(.largeTitle)
                }
                .foregroundColor(.black)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    WeatherDetailsView(visibilityKM: 12.4, humidity: 12, pressureMB: 143.5, feelsLikeC: 44)
}
