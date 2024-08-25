//
//  WeatherViewModelTests.swift
//  Sky TrackTests
//
//  Created by eng.omar on 25/08/2024.
//

import XCTest
@testable import Sky_Track

final class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!

    override func setUpWithError() throws {
        viewModel = WeatherViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    func testGetDayName() {
          

         let tomorrowName = viewModel.getDayName(for: 1)
         let yesterdayName = viewModel.getDayName(for: -1)
         
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "EEEE"
         let expectedTomorrowName = dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
         let expectedYesterdayName = dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
         
         XCTAssertEqual(tomorrowName, expectedTomorrowName, "The day name is incorect")
         XCTAssertEqual(yesterdayName, expectedYesterdayName, "The day name  is incorect.")
     }
    
    func testFetchWeather() {
        let exp = expectation(description: "adding response done")
        viewModel.fetchWeather()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                 XCTAssertNotNil(self.viewModel.weatherData)
            exp.fulfill()
             }
             waitForExpectations(timeout: 1.0, handler: nil)
    }



}
