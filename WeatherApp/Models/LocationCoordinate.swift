//
//  CLLocationCoordinate2D.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import Foundation
import CoreLocation

struct EquatableCoordinate: Equatable {
    var coordinate: CLLocationCoordinate2D

    static func == (lhs: EquatableCoordinate, rhs: EquatableCoordinate) -> Bool {
        lhs.coordinate.latitude == rhs.coordinate.latitude &&
        lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}
