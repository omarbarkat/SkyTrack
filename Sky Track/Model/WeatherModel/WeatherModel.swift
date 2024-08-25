//
//  WeatherModel.swift
//  Sky Track
//
//  Created by eng.omar on 22/08/2024.
//

import Foundation




import Foundation

// MARK: - WeatherResponse
struct Weather: Codable {
    let location: Location?
    let current: CurrentWeather?
    let forecast: Forecast?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let region: String?
    let country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let lastUpdatedEpoch: Int?
    let lastUpdated: String?
    let tempC, tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMPH, windKPH: Double?
    let windDegree: Int?
    let windDir: String?
    let pressureMB: Double?
    let pressureIn: Double?
    let precipMM, precipIn: Double?
    let humidity, cloud: Int?
    let feelslikeC, feelslikeF: Double?
    let windchillC, windchillF, heatindexC, heatindexF: Double?
    let dewpointC, dewpointF: Double?
    let visKM, visMiles: Double?
    let uv: Double?
    let gustMPH, gustKPH: Double?
    let airQuality: AirQuality?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMPH = "wind_mph"
        case windKPH = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMM = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMPH = "gust_mph"
        case gustKPH = "gust_kph"
        case airQuality = "air_quality"
    }
}

// MARK: - AirQuality
struct AirQuality: Codable {
    let co, no2, o3, so2: Double?
    let pm25, pm10: Double?
    let usEpaIndex, gbDefraIndex: Int?

    enum CodingKeys: String, CodingKey {
        case co, no2, o3, so2
        case pm25 = "pm2_5"
        case pm10
        case usEpaIndex = "us-epa-index"
        case gbDefraIndex = "gb-defra-index"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String?
    let icon: String?
    let code: Int?
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [ForecastDay]?
}

// MARK: - ForecastDay
struct ForecastDay: Codable {
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase: String?
    let moonIllumination: String?
    let isMoonUp, isSunUp: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double?
    let avgtempC, avgtempF: Double?
    let maxwindMPH, maxwindKPH: Double?
    let totalprecipMM, totalprecipIn: Double?
    let totalsnowCM: Double?
    let avgvisKM, avgvisMiles: Double?
    let avghumidity: Int?
    let dailyWillItRain, dailyChanceOfRain, dailyWillItSnow, dailyChanceOfSnow: Int?
    let condition: Condition?
    let uv: Double?
    let airQuality: AirQuality?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMPH = "maxwind_mph"
        case maxwindKPH = "maxwind_kph"
        case totalprecipMM = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
        case airQuality = "air_quality"
    }
}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Int?
    let time: String?
    let tempC, tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMPH, windKPH: Double?
    let windDegree: Int?
    let windDir: String?
    let pressureMB: Double?
    let pressureIn: Double?
    let precipMM, precipIn: Double?
    let snowCM: Double?
    let humidity, cloud: Int?
    let feelslikeC, feelslikeF: Double?
    let windchillC, windchillF, heatindexC, heatindexF: Double?
    let dewpointC, dewpointF: Double?
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int?
    let visKM, visMiles: Double?
    let gustMPH, gustKPH: Double?
    let uv: Double?
    let airQuality: AirQuality?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMPH = "wind_mph"
        case windKPH = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMM = "precip_mm"
        case precipIn = "precip_in"
        case snowCM = "snow_cm"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMPH = "gust_mph"
        case gustKPH = "gust_kph"
        case uv
        case airQuality = "air_quality"
    }
}












//
//// Struct لتمثيل بيانات الموقع
//struct Location: Decodable {
//    let name: String
//    let region: String
//    let country: String
//    let lat: Double
//    let lon: Double
//    let tz_id: String
//    let localtime_epoch: Int
//    let localtime: String
//}
//
//// Struct لتمثيل حالة الطقس الحالية
//struct WeatherCondition: Decodable {
//    let text: String
//    let icon: String
//    let code: Int
//}
//
//// Struct لتمثيل بيانات الطقس الحالية
//struct CurrentWeather: Decodable {
//    let last_updated_epoch: Int
//    let last_updated: String
//    let temp_c: Double
//    let temp_f: Double
//    let is_day: Int
//    let condition: WeatherCondition
//    let wind_mph: Double
//    let wind_kph: Double
//    let wind_degree: Int
//    let wind_dir: String
//    let pressure_mb: Double
//    let pressure_in: Double
//    let precip_mm: Double
//    let precip_in: Double
//    let humidity: Int
//    let cloud: Int
//    let feelslike_c: Double
//    let feelslike_f: Double
//    let windchill_c: Double
//    let windchill_f: Double
//    let heatindex_c: Double
//    let heatindex_f: Double
//    let dewpoint_c: Double
//    let dewpoint_f: Double
//    let vis_km: Double
//    let vis_miles: Double
//    let uv: Double
//    let gust_mph: Double
//    let gust_kph: Double
//}
//
//// Struct لدمج بيانات الموقع والطقس الحالية
//struct Weather: Decodable {
//    let location: Location
//    let current: CurrentWeather
//}