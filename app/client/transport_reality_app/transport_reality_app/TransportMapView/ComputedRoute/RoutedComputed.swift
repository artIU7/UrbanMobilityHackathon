//
//  RoutedComputed.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 17.04.2021.
//

import Foundation
import NMAKit


extension TransportMapView {

func addRoute() {
    
    let routingMode = NMARoutingMode.init(
        routingType: NMARoutingType.fastest,
        transportMode: NMATransportMode.publicTransport,
        routingOptions: []
    )
    routingMode.resultLimit = 30

    // check if calculation completed otherwise cancel.
    if !(progress?.isFinished ?? false) {
        progress?.cancel()
    }

    // Use banned areas if needed
    //addBannedAreas(coreRouter);

    // store progress.
    progress = coreRouter.calculateRoute(withStops: route_points, routingMode: routingMode, { (routeResult, error) in
        if (error != NMARoutingError.none) {
            NSLog("Error in callback: \(error)")
            return
        }
        
        guard let route = routeResult?.routes?.first else {
            print("Empty Route result")
            return
        }
        
        guard let box = route.boundingBox, let mapRoute = NMAMapRoute.init(route) else {
            print("Can't init Map Route")
            return
        }
        
        if (self.mapRouts.count != 0) {
            for route in self.mapRouts {
                self.mapView.remove(mapObject: route)
            }
            self.mapRouts.removeAll()
        }
        
        self.mapRouts.append(mapRoute)

        self.mapView.set(boundingBox: box, animation: NMAMapAnimation.linear)
        self.mapView.add(mapObject: mapRoute)
    })
}
    func clearRoute() {
        for route in mapRouts {
            mapView.remove(mapObject: route)
        }
        
        mapView.zoomLevel = mapView.zoomLevel
    }
}
