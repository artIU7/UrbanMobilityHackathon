//
//  Geocoder+Helper.swift
//  transport_reality_app
//
//  Created by Артем Стратиенко on 17.04.2021.
//

import Foundation
import NMAKit

extension TransportMapView {
    func parseResultFromReverseGeocodeRequest(request: NMARequest?, requestData data: Any?, error: Error?) {

        if error != nil {
            print("error \(error!.localizedDescription)")
            return
        }
        
        if (!(request is NMAReverseGeocodeRequest)) {
            print("invalid type returned")
            return
        }
        
        guard let arr = data as? NSArray, arr.count != 0 else {
            return
        }
        
        if let address = (arr.object(at: 0) as? NMAReverseGeocodeResult)?.location?.address?.formattedAddress {
            serachingAdress.text = address
        }
    }
}
