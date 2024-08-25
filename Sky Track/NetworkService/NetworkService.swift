//
//  NetworkService.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation

class NetworkService {
    func getData(handler: @escaping ((Weather) -> Void)) {
        guard let url = createURL() else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
                let task = session.dataTask(with: request) { data, _, _ in
            guard let data else { return }
            self.parseData(data: data, handler: handler)
        }
        task.resume()
    }
    private func createURL() -> URL? {
        let longitude = 31.233334
        let latitude = 30.033333
        let apiKey = "50fbce3826fe4397b75130655242408"
        let url = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(longitude),\(latitude)&days=3&aqi=yes&alerts=no"
        return URL(string: url)
    }
    private func parseData(data: Data, handler: @escaping ((Weather) -> Void)) {
        do {
            let decodedData = try JSONDecoder().decode(Weather.self, from: data)
            handler(decodedData)
            print(decodedData)
        } catch {
            print(error.localizedDescription)
        }
    }
}




