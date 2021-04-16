//
//  File.swift
//  
//
//  Created by Артем Стратиенко on 16.04.2021.
//
import Fluent
import Vapor

final class Shape: Model, Content {
    static let schema = "shapes"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "shape_lat")
    var shape_lat: Double
    
    @Field(key: "shape_lon")
    var shape_lon: Double
    
    @Field(key: "shape_order")
    var shape_order: Int
    
    @Field(key: "route_id")
    var route_id: String

    init() { }

    init(id: UUID? = nil, shape_lat : Double, shape_lon : Double, shape_order : Int, route_id : String) {
        self.id = id
        self.shape_lat = shape_lat
        self.shape_lon = shape_lon
        self.shape_order = shape_order
    }
}
