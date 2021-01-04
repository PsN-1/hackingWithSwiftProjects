//
//  ViewController.swift
//  Project16
//
//  Created by Pedro Neto on 03/01/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(presentAlert))
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 28.895111, longitude: -77.036667), info: "Name after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    
    @objc func presentAlert() {
        let ac = UIAlertController(title: "Select Map mode", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: setMapStyle))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: setMapStyle))
        ac.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: setMapStyle))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: setMapStyle))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: setMapStyle))
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: setMapStyle))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: setMapStyle))

        present(ac, animated: true)
    }
    
    func setMapStyle(_ action: UIAlertAction) {
        guard let styleName = action.title else { return }
    
        switch styleName {
        case "Satellite Flyover":
            mapView.mapType = .satelliteFlyover
        case "Satellite":
            mapView.mapType = .satellite
        case "Muted Standard":
            mapView.mapType = .mutedStandard
        case "Hybrid Flyover":
            mapView.mapType = .hybridFlyover
        case "Hybrid":
            mapView.mapType = .hybrid
        case "Standard":
            mapView.mapType = .standard
        default:
            mapView.mapType = .standard
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.pinTintColor = .blue

        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }

        let placeName = capital.title

        if let vc = storyboard?.instantiateViewController(withIdentifier: "wikiPage") as? DetailViewController {
            vc.capital = placeName
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
