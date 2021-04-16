//
//  File.swift
//  
//
//  Created by Артем Стратиенко on 16.04.2021.
//
import Fluent

struct CreateShape: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("shapes")
            .id()
            .field("shape_lat", .double, .required)
            .field("shape_lon", .double, .required)
            .field("shape_order", .double, .required)
            .field("route_id", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("shapes").delete()
    }
}
