////
////  demo.swift
////  Sky Track
////
////  Created by eng.omar on 24/08/2024.
////
//
//import Foundation
//
////
////  WeatherModel.swift
////  Sky Track
////
////  Created by eng.omar on 22/08/2024.
////
//
//import Foundation
//
//struct Weather: Decodable, Identifiable {
//    var id: Int?
//    
//    var location: Location?
//    var current: Current?
//}
//
//// MARK: - Current
//struct Current: Decodable, Identifiable {
//    var id: Int?
//    
//    var last_updated_epoch: Int?
//    var last_updated: String?
//    var temp_c: Double?
//       var temp_f: Double?
//    var is_day: Int?
//    var condition: Condition?
//    var wind_mph, wind_kph: Double?
//    var wind_degree: Int?
//    var wind_dir: String?
//    var pressure_mb: Int?
//    var pressure_in: Double?
//    var precip_mm, precip_in, humidity, cloud: Int?
//    var feelslike_c, feelslike_f, windchill_c: Double?
//    var windchill_f: Int?
//    var heatindex_c: Double?
//    var heatindex_f, dewpoint_c: Int?
//    var dewpoint_f: Double?
//    var vis_km, vis_miles, uv: Int?
//    var gust_mph, gust_kph: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case last_updated_epoch
//        case last_updated
//        case temp_c
//        case temp_f
//        case is_day
//        case condition
//        case wind_mph
//        case wind_kph
//        case wind_degree
//        case wind_dir
//        case pressure_mb
//        case pressure_in
//        case precip_mm
//        case precip_in
//        case humidity, cloud
//        case feelslike_c
//        case feelslike_f
//        case windchill_c
//        case windchill_f
//        case heatindex_c
//        case heatindex_f
//        case dewpoint_c
//        case dewpoint_f
//        case vis_km
//        case vis_miles
//        case uv
//        case gust_mph
//        case gust_kph
//    }
//}
//
//// MARK: - Condition
//struct Condition: Codable {
//    var text, icon: String?
//    var code: Int?
//}
//
//// MARK: - Location
//struct Location: Codable {
//    var name, region, country: String?
//    var lat, lon: Double?
//    var tz_id: String?
//    var localtimeEpoch: Int?
//    var localtime: String?
//
//    enum CodingKeys: String, CodingKey {
//        case name, region, country, lat, lon
//        case tz_id
//        case localtimeEpoch
//        case localtime
//    }
//}
