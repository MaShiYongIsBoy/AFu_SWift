//
//  AFMapAroundController.swift
//  AFu_Swift
//
//  Created by bang on 16/4/1.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit
class AFMapAroundController: UIViewController {
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// 地图
    var mapView:MKMapView?
    /// 定位
    var manager:CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView = MKMapView(frame:MapFrame)
        self.view.addSubview(mapView!)
        mapView?.showsUserLocation = true
        manager = CLLocationManager.init()
        manager?.delegate = self
        manager?.requestAlwaysAuthorization()
        manager?.startUpdatingLocation()
    }
    override func viewDidDisappear(animated: Bool) {
        mapView?.removeFromSuperview()
        mapView = nil
    }
}
/// MARK - 地图
extension AFMapAroundController:MKMapViewDelegate{
    
}
/// MARK - 定位
extension AFMapAroundController:CLLocationManagerDelegate{
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locaion:CLLocation          = locations.first!
        let cl2d:CLLocationCoordinate2D = locaion.coordinate
        let span:MKCoordinateSpan       = MKCoordinateSpanMake(0.01, 0.01)
        let region:MKCoordinateRegion   = MKCoordinateRegionMake(cl2d, span)
        mapView?.region                 = region
        manager.stopUpdatingLocation()
    }
}
