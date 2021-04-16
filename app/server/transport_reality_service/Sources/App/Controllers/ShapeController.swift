//
//  File.swift
//  
//
//  Created by Артем Стратиенко on 16.04.2021.
//

import Fluent
import Vapor

struct ShapeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let shapes = routes.grouped("shapes")
        shapes.get(use: index)
        shapes.post(use: create)
        shapes.group(":shapeID") { shape in
            shape.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Shape]> {
        return Shape.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Shape> {
        let shape = try req.content.decode(Shape.self)
        return shape.save(on: req.db).map { shape }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Route.find(req.parameters.get("shapeID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
