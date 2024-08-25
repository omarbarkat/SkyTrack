//
//  DayDetailsViewModelTests.swift
//  Sky TrackTests
//
//  Created by eng.omar on 25/08/2024.
//

import XCTest
@testable import Sky_Track

final class DayDetailsViewModelTests: XCTestCase {
    var viewModel: DayDetailsViewModel!

    override func setUpWithError() throws {
        viewModel = DayDetailsViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testConvertToTimeOnly() {
           let dateString = "2024-08-25 15:30"
           let expectedTimeOnly = "15:30"
           
        let result = viewModel.convertToTimeOnly(dateString: dateString)
           
           XCTAssertEqual(result, expectedTimeOnly, "unexpected Res")
       }
    
  

}
