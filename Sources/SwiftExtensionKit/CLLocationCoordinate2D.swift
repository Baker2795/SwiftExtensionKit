//
//  CLLocationCoordinate2D.swift
//
//
//  Created by John Baker on 12/21/23.
//

import CoreLocation

public extension CLLocationCoordinate2D {
    func isWithinDistance(of coordinate: CLLocationCoordinate2D, distanceInMeters: CLLocationDistance) -> Bool {
        let location1 = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let location2 = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        let distance = location1.distance(from: location2)
        return distance <= distanceInMeters
    }
}
