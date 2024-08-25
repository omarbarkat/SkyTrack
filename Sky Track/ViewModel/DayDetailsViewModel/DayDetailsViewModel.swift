//
//  DayDetailsViewModel.swift
//  Sky Track
//
//  Created by eng.omar on 25/08/2024.
//

import Foundation

class DayDetailsViewModel: ObservableObject {
    @Published var current: Weather?

    
    func convertToTimeOnly(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" 

        dateFormatter.timeZone = TimeZone.current
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "HH:mm" 
            let timeOnlyString = dateFormatter.string(from: date)
            return timeOnlyString
        } else {
            return "Invalid date"
        }
    }
}
