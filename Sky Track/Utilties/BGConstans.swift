//
//  BGConstans.swift
//  GamePlay
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation

struct BGConstants {
    
    
    // MARK: - Network response status
    
    static var success:Int {return 1}
    static var added:Int {return 202}
    static var failed:Int {return 0}
    static var created:Int {return 201}
    static var unprocessableEntity : Int {return 401}
    static var notActive : Int {return 405}
    static var unauthenticated : Int {return 403}
    static var notAcceptable : Int {return 422}
    static var notFound : Int {return 404}
    static var userType : Int {return 1}
        
    // MARK: - APIs Constants
    static var baseURL:String {return "https://api.weatherapi.com/v1/current.json?key=50fbce3826fe4397b75130655242408&q=Cairo"}
}

