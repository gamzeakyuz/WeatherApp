//
//  DateHelper.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import Foundation

func getDayLabel(from dateString: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let date = formatter.date(from: dateString) else { return dateString }

    let calendar = Calendar.current
    if calendar.isDateInToday(date) {
        return "Bugün"
    } else if calendar.isDateInTomorrow(date) {
        return "Yarın"
    } else {
        formatter.locale = Locale(identifier: "tr_TR") // Türkçe için
        formatter.dateFormat = "d MMMM" // Örn: 18 Mayıs
        return formatter.string(from: date)
    }
}
