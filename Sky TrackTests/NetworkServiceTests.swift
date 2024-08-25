//
//  NetworkServiceTests.swift
//  Sky TrackTests
//
//  Created by eng.omar on 25/08/2024.
//

import XCTest
@testable import Sky_Track


final class NetworkServiceTests: XCTestCase {
    
    var networkService: NetworkService!

    override func setUpWithError() throws {

        networkService = NetworkService()
        URLProtocol.registerClass(MockURLProtocol.self)

    }

    override func tearDownWithError() throws {
        URLProtocol.unregisterClass(MockURLProtocol.self)

        networkService = nil
        super.tearDown()

    }
    
    func testGetDataSuccess() {
         let expectation = self.expectation(description: "Completion handler invoked")
        struct Weather: Codable {
            let location: Location
            let current: Current
            let forecast: Forecast
            
            struct Location: Codable {
                let name: String
                let region: String
                let country: String
                let lat: Double
                let lon: Double
                let tz_id: String
                let localtime_epoch: Int
                let localtime: String
            }
            
            struct Current: Codable {
                let temp_c: Double
                let temp_f: Double
                let condition: Condition
                let wind_mph: Double
                let wind_kph: Double
                let humidity: Int
                let precip_mm: Double
                let feelslike_c: Double
                let feelslike_f: Double
                
                struct Condition: Codable {
                    let text: String
                    let icon: String
                    let code: Int
                }
            }
            
            struct Forecast: Codable {
                let forecastday: [ForecastDay]
                
                struct ForecastDay: Codable {
                    let date: String
                    let day: Day
                    
                    struct Day: Codable {
                        let maxtemp_c: Double
                        let maxtemp_f: Double
                        let mintemp_c: Double
                        let mintemp_f: Double
                        let avgtemp_c: Double
                        let avgtemp_f: Double
                        let maxwind_mph: Double
                        let maxwind_kph: Double
                        let totalprecip_mm: Double
                        let totalsnow_cm: Double
                        let avgvis_km: Double
                        let avghumidity: Double
                        let daily_will_it_rain: Int
                        let daily_chance_of_rain: Int
                        let daily_will_it_snow: Int
                        let daily_chance_of_snow: Int
                        let condition: Condition
                        
                        struct Condition: Codable {
                            let text: String
                            let icon: String
                            let code: Int
                        }
                    }
                }
            }
        }
        let mockWeather = Weather(
            location:Weather.Location (
                name: "Cairo",
                region: "",
                country: "Egypt",
                lat: 30.0444,
                lon: 31.2357,
                tz_id: "Africa/Cairo",
                localtime_epoch: 1689123456,
                localtime: "2024-08-25 15:00"
            ),
            current: Weather.Current(
                temp_c: 30.0,
                temp_f: 86.0,
                condition: Weather.Current.Condition(
                    text: "Clear",
                    icon: "//cdn.weatherapi.com/weather/64x64/day/113.png",
                    code: 1000
                ),
                wind_mph: 5.0,
                wind_kph: 8.0,
                humidity: 50,
                precip_mm: 0.0,
                feelslike_c: 32.0,
                feelslike_f: 89.6
            ),
            forecast: Weather.Forecast(
                forecastday: [
                    Weather.Forecast.ForecastDay(
                        date: "2024-08-25",
                        day: Weather.Forecast.ForecastDay.Day(
                            maxtemp_c: 34.0,
                            maxtemp_f: 93.2,
                            mintemp_c: 25.0,
                            mintemp_f: 77.0,
                            avgtemp_c: 29.0,
                            avgtemp_f: 84.2,
                            maxwind_mph: 10.0,
                            maxwind_kph: 16.0,
                            totalprecip_mm: 0.0,
                            totalsnow_cm: 0.0,
                            avgvis_km: 10.0,
                            avghumidity: 55.0,
                            daily_will_it_rain: 0,
                            daily_chance_of_rain: 0,
                            daily_will_it_snow: 0,
                            daily_chance_of_snow: 0,
                            condition: Weather.Forecast.ForecastDay.Day.Condition(
                                text: "Sunny",
                                icon: "//cdn.weatherapi.com/weather/64x64/day/113.png",
                                code: 1000
                            )
                        )
                    )
                ]
            )
        )
        
         let mockData = try! JSONEncoder().encode(mockWeather)
         
         MockURLProtocol.testData = mockData
         MockURLProtocol.error = nil
         
         networkService.getData { weather in
             XCTAssertNotNil(weather)
             expectation.fulfill()
         }
         
         waitForExpectations(timeout: 1.0, handler: nil)
     }

    func testGetDataFailure() {
         let expectation = self.expectation(description: "adding response done")
         
         MockURLProtocol.testData = nil
         MockURLProtocol.error = NSError(domain: "TestError", code: 1, userInfo: nil)
         
         networkService.getData { weather in
             XCTAssertNotNil(weather)
             expectation.fulfill()
         }
         
         waitForExpectations(timeout: 1.0, handler: nil)
     }
   

}
