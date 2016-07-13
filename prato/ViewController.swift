//
//  ViewController.swift
//  prato
//
//  Created by ZEYU_Michael_Li on 11/07/2016.
//  Copyright © 2016 ZEYU_Michael_Li. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBAction func DisplayInfo1(sender: AnyObject) {
        
    }
    @IBAction func DisplayInfo2(sender: AnyObject) {
        
    }
    @IBAction func DIsplayInfo3(sender: AnyObject) {
        
        
    }
    
    
    @IBOutlet weak var Mapview: MKMapView!
    let locationManager=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Piazza della Signoria
        self.locationManager.delegate=self
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.Mapview.showsUserLocation=true
        let initialLocation = CLLocation(latitude: 43.769596, longitude:  11.255637)
        centerMapOnLocation(initialLocation)
        // Do any additional setup after loading the view, typically from a nib.
        //Mapview.delegate = self
        Mapview.camera.pitch = 0.0
        Mapview.camera.altitude = 300.0
        //Mapview.mapType = .Satellite
        Mapview.mapType = .Satellite
        
    }
    let regionRadius: CLLocationDistance = 50
    func centerMapOnLocation(location: CLLocation) {
        
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        
        Mapview.setRegion(coordinateRegion, animated: true)
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
        
        self.Mapview.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
}

