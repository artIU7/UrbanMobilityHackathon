//
//  Helper+DrawRoute.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 17.04.2021.
//

import Foundation
import NMAKit

extension TransportMapView {
    
        open func distanceInRoute(_ routeIn : [NMAGeoCoordinates]?) -> Double {
            var allDistance = 0.0
            let segment = routeIn!.count
            for i in 0...segment - 2 {
                allDistance += distanceGeo(pointA: routeIn![i], pointB: routeIn![i + 1])
            }
            return allDistance
        }
    public func distanceGeo(pointA : NMAGeoCoordinates,pointB : NMAGeoCoordinates) -> Double {
        let toRad = Double.pi/180
        let radial = acos(sin(pointA.latitude*toRad)*sin(pointB.latitude*toRad) + cos(pointA.latitude*toRad)*cos(pointB.latitude*toRad)*cos((pointA.longitude - pointB.longitude)*toRad))
        let R = 6378.137//6371.11
        let D = (radial*R)*1000
        return D
    }
    func addMarkerStation(_ positionAnchor : NMAGeoCoordinates, index : Int, markerUI : UIImage) {
        let marker = NMAMapMarker(geoCoordinates: positionAnchor, image: markerUI)
          marker.resetIconSize()
          marker.setSize(CGSize(width: 1, height: 1), forZoomRange: NSRange(location: 5,length: 20))
          clusterTemp.addMarker(marker)
          self.mapView.add(clusterLayer: clusterTemp)
          //self.mapView.add(mapObject: marker)
      }
    }

