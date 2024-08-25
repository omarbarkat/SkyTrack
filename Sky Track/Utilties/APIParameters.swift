//
//  APIParameters.swift
//  GamePlay
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation

enum APIParameters {
    
    case cairo
    var paramters: [String: Any] {
        switch self {
        case .cairo:
            return [
                         "id": "360630",
                         "appid": "ea14dfa08da74d8f940194303242208"
                     ]
        }
    }
}
