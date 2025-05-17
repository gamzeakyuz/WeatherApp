//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import Foundation

struct DailyWeather: Decodable {
    let time: [String]
    let temperature_2m_max: [Double]
    let temperature_2m_min: [Double]
    let weathercode: [Int]
}
