//
//  HeleprTouchGesture.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 17.04.2021.
//

import Foundation
import UIKit
import NMAKit

extension TransportMapView  {
    // add touch in map and draw rote to point
    func mapView(_ mapView: NMAMapView, didReceiveLongPressAt location: CGPoint) {
        let plks = String(describing: mapView.geoCoordinates(from: location))//mapView.geoCoordinates(from: location))
        print(plks)
        UIView.animate(withDuration: 1) { [self] in
            routingConfigView.alpha = 1
            routingConfigView.isHidden = false
            //self.mapView.remove(clusterLayer: clusterTemp)
            let checkPoint = mapView.geoCoordinates(from: location)!
            grabCoordinate = checkPoint
            managerGeocoder.createReverseGeocodeRequest(coordinates: checkPoint).start(parseResultFromReverseGeocodeRequest(request:requestData:error:))
            self.addMarkerStation(mapView.geoCoordinates(from: location)!, index: 3, markerUI: UIImage(named: "custom_poi")!)
        }
    }
    // one tap
    func mapView(_ mapView: NMAMapView, didReceiveTapAt location: CGPoint) {
        let objStruct = mapView.objects(at: location)
        if (routingConfigView.isHidden) {
        } else {
            routingConfigView.isHidden = true
            locationButton.isHidden = false
        }
        if objStruct != [] {
            guard let transit = objStruct.first as? NMATransitObject else {return}
            self.addMarkerStation(mapView.geoCoordinates(from: location)!, index: 3, markerUI: UIImage(named: "bus_maps_icon")!)
            }
        let setCenter = mapView.geoCoordinates(from: location)
        self.mapView.set(geoCenter: setCenter!, zoomLevel: self.mapView.zoomLevel, animation: .linear)
    }
    // *LongPress* touch to detected point in poly
       
    func mapView(_ mapView: NMAMapView, didReceiveDoubleTapAt location: CGPoint) {
        var getCoordinate = mapView.geoCoordinates(from: location)
    }

}
