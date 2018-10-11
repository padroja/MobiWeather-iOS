//
//  LocationPickerViewController.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit
import MapKit

protocol LocationPickerDelegate {
    func locationPickerDidAddLocations()
}

class LocationPickerViewController: MobiBaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func closeAction(_ sender: UIButton) {
        delegate?.locationPickerDidAddLocations()
        dismiss()
    }
    
    var places = [LocalLocation]()
    var delegate: LocationPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        setupMapView()
    }
    
    private func setupMapView() {
        let touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(touchedOnMap(gestureRecognizer:)))
        touchGesture.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(touchGesture)
    }
    
    @objc func touchedOnMap(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            getDetailsFor(coordinates: coordinates)
        }
    }
    
    private func getDetailsFor(coordinates: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: coordinates.latitude,
            longitude: coordinates.longitude)) { (placemarks, error) in
                if error != nil {
                    print("Error adding location")
                    
                    return
                }
                
                if placemarks!.count > 0 {
                    self.addAnnotationAtPoint(coordinate: coordinates, placemark: placemarks?.first)
                } else {
                    print("Can't fetch location details")
                    self.addAnnotationAtPoint(coordinate: coordinates, placemark: placemarks?.first)
                }
        }
    }
    
    private func addAnnotationAtPoint(coordinate: CLLocationCoordinate2D, placemark: CLPlacemark?) {
        var annotationTitle = ""
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        if let placemark = placemark {
            annotationTitle = placemark.locality ?? "N/A"
        } else {
            annotationTitle = "Unknown Place"
        }
        annotation.title = annotationTitle
        mapView.addAnnotation(annotation)
        let placesDict = ["cityName" : annotationTitle,
                          "location" : coordinate.getLocationString()]
        LocalStorageManager.add(location: placesDict.getLocalLocationModel())
    }
}
