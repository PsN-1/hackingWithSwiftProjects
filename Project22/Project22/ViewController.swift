//
//  ViewController.swift
//  Project22
//
//  Created by Pedro Neto on 25/02/21.
//


import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var distanceReading: UILabel!
    @IBOutlet weak var beaconLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    
    var locationManager: CLLocationManager?
    var firstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
        circleView.backgroundColor = .black
        circleView.layer.cornerRadius = 128
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable(){
                    startScanning()
                }
            }
        }
    }

    func startScanning() {
        
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")

        beaconLabel.text = beaconRegion.identifier

        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
        
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            case .far:
                self.circleView.backgroundColor = .blue
                self.distanceReading.text = "FAR"
                self.circleView.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                
            case .near:
                self.circleView.backgroundColor = .orange
                self.distanceReading.text = "NEAR"
                self.circleView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                
            case .immediate:
                self.circleView.backgroundColor = .red
                self.distanceReading.text = "RIGHT HERE"
                self.circleView.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            default:
                self.circleView.backgroundColor = .gray
                self.distanceReading.text = "UNKNOWN"
                self.circleView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        print(beacons)
        
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
            
            if firstTime {
                firstTime.toggle()
                
                let ac = UIAlertController(title: "Beacon Found!", message: "A new Beacon was detected", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Ok", style: .default))
                ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                present(ac, animated: true)
            }
        } else {
            update(distance: .unknown)
        }
    }
}

    
