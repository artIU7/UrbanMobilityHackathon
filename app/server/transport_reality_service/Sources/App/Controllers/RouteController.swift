import Fluent
import Vapor

struct RouteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let routes = routes.grouped("routes")
        routes.get(use: index)
        routes.post(use: create)
        routes.group(":routeID") { route in
            route.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Route]> {
        return Route.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Route> {
        let route = try req.content.decode(Route.self)
        return route.save(on: req.db).map { route }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Route.find(req.parameters.get("routeID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
