//
//  ViewController.swift
//  MyMap
//
//  Created by Aibek Rakhim on 6/20/17.
//  Copyright © 2017 ibek inc. All rights reserved.
//
import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    var selectedIndexPath:Int?
    var places = Place.loadPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.showsPointsOfInterest = false
        locationManager.delegate = self
        mapView.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        // if user allows to use user`s location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
        } else if !CLLocationManager.locationServicesEnabled() {
            let initialization = CLLocation(latitude: 43.222, longitude: 76.8512)
            centerMapOnLocation(location: initialization)
        }
        // else use default Almaty city location

        mapView.showsUserLocation = true
        self.genData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSegue" {
            if let detailPinVC = segue.destination as? DetailedPinViewController {
                if let indexPath = selectedIndexPath {
                    detailPinVC.place = places[selectedIndexPath!]
                }
            }
        }
    }
    
    
    func genData() {
        for place in places {
            mapView.addAnnotation(place)
        }
    }
    
    //distance from point
    let regionRadius: CLLocationDistance = 100
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}


//MARK - MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
    //viewFor annotation calls every pin annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //MARK: Customizing the pins view
        let clA = annotation as? Place
        let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ident")
        pinView.pinTintColor = clA?.pinTintColor
        pinView.canShowCallout = true
        pinView.calloutOffset = CGPoint(x: -5, y: 5)
        let btn = UIButton(type: .detailDisclosure)
        btn.addTarget(self, action: #selector(infoPressed), for: .touchUpInside)
        pinView.rightCalloutAccessoryView = btn
        return pinView
    }
    
    func infoPressed() {
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let title = (view.annotation?.title ?? "") ?? ""
        
        for (index, element) in places.enumerated() {
            if element.title == title {
                selectedIndexPath = index
            }
        }
    
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "showSegue", sender: self)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.centerMapOnLocation(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


