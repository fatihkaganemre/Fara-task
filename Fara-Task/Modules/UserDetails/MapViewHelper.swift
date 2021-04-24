//
//  MapViewHelper.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation
import MapKit
import CoreLocation

struct MapViewHelper {
    func mapView(title: String, latitute: String, longitute: String) -> MKMapView {
        let mapView = MKMapView()
        let regionRadius: CLLocationDistance = 1500
        let coordinate: CLLocationCoordinate2D = .init(
            latitude: CLLocationDegrees(latitute)!,
            longitude: CLLocationDegrees(longitute)!
        )
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        let annotation = PropertyAnnotation(title: title, coordinate: coordinate)
        mapView.setRegion(region, animated: false)
        mapView.addAnnotation(annotation)

        return mapView
    }
}

fileprivate class PropertyAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
