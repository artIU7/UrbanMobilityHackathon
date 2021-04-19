//
//  TourViewController.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 16.04.2021.
//

import UIKit
import NMAKit

//
//
var clusterTemp = NMAClusterLayer()
//
class TourViewController: UIViewController {

    // custom tint tab bar
    var tabBarTag: Bool = true

    // init maps
    let mapView = NMAMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tour"
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.loadUIMap()
            self.mapInit()
        }
        // Do any additional setup after loading the view.
    }
    
    func loadUIMap() {
        view.addSubview(mapView)
        self.mapView.snp.makeConstraints { (marker) in
            marker.top.equalTo(self.view).inset(0)
            marker.left.right.equalTo(self.view).inset(0)
            marker.bottom.equalTo(self.view).inset(0)
        }
    }
    func mapInit() {
        self.mapView.positionIndicator.isVisible = true
        self.mapView.positionIndicator.tracksCourse = true
        let accuracyColor = #colorLiteral(red: 0.4004088239, green: 0.9419217957, blue: 0.8626950897, alpha: 0.4428563784)
        self.mapView.positionIndicator.isAccuracyIndicatorVisible = true
        self.mapView.positionIndicator.accuracyIndicatorColor = accuracyColor
        mapView.mapScheme = NMAMapSchemePedestrianDay
        //
        let fakePosition = CLLocationCoordinate2D(latitude: 56.936619, longitude: 24.169127)
        //
        self.mapView.set(geoCenter: NMAGeoCoordinates(latitude: fakePosition.latitude, longitude: fakePosition.longitude), zoomLevel: 15, orientation: 0, tilt: 15, animation: .linear)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
          
           if tabBarTag == true {
               self.tabBarController?.tabBar.tintColor = UIColor.yellow
                self.tabBarController?.tabBar.backgroundColor = #colorLiteral(red: 0.1156016763, green: 0.1961770704, blue: 0.3223885175, alpha: 1)//UIColor.cyan

           } else {
               self.tabBarController?.tabBar.tintColor = UIColor.white
           }
    }
}
extension TourViewController : NMAMapGestureDelegate,NMAMapViewDelegate,NMATransitManagerDelegate {
    
}
extension TourViewController : CLLocationManagerDelegate {
    
}
