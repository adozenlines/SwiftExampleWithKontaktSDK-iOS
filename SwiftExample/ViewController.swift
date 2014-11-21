//
//  ViewController.swift
//  SwiftExample
//
//  Created by Lukasz Hlebowicz on 14/11/14.
//  Copyright (c) 2014 kontakt.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KTKLocationManagerDelegate {

    let locationManager : KTKLocationManager = KTKLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (KTKLocationManager.canMonitorBeacons())
        {
            var region : KTKRegion = KTKRegion();
            region.uuid = "f7826da6-4fa2-4e98-8024-bc5b71e0893e"; // kontakt.io proximity UUID
            
            self.locationManager.setRegions([region]);
            self.locationManager.delegate = self;
        }
    }

    override func viewDidAppear(animated: Bool) {
        self.locationManager.startMonitoringBeacons();
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.locationManager.stopMonitoringBeacons();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(locationManager: KTKLocationManager!, didChangeState state: KTKLocationManagerState, withError error: NSError!) {
        if (state == .Failed)
        {
            println("Something went wrong with your Location Services settings. Check your settings.");
        }
    }
    
    func locationManager(locationManager: KTKLocationManager!, didEnterRegion region: KTKRegion!) {
        println("Enter region \(region.identifier)");
    }
    
    func locationManager(locationManager: KTKLocationManager!, didExitRegion region: KTKRegion!) {
        println("Exit region \(region.identifier)");
    }
    
    func locationManager(locationManager: KTKLocationManager!, didRangeBeacons beacons: [AnyObject]!) {
        println("There are \(beacons.count) beacons in range");
    }
}

