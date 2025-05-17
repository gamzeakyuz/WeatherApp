//
//  WeatherCode.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import Foundation

func weatherCodeToDescription(_ code: Int) -> String {
    switch code {
    case 0: return "Açık Gökyüzü"
    case 1, 2, 3: return "Parçalı Bulutlu"
    case 45, 48: return "Sis"
    case 51, 53, 55: return "Hafif Yağmur"
    case 61, 63, 65: return "Yağmur"
    case 71, 73, 75: return "Kar"
    case 80, 81, 82: return "Sağanak Yağmur"
    case 95: return "Fırtına"
    default: return "Bilinmeyen"
    }
}

func weatherCodeToIconName(_ code: Int) -> String {
    switch code {
    case 0: return "sun.max.fill"
    case 1, 2, 3: return "cloud.sun.fill"
    case 45, 48: return "cloud.fog.fill"
    case 51, 53, 55: return "cloud.drizzle.fill"
    case 61, 63, 65: return "cloud.rain.fill"
    case 71, 73, 75: return "cloud.snow.fill"
    case 80, 81, 82: return "cloud.heavyrain.fill"
    case 95: return "cloud.bolt.rain.fill"
    default: return "questionmark"
    }
}
