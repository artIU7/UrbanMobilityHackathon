import Fluent

struct CreateRoute: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("routes")
            .id()
            .field("route_id", .string, .required)
            .field("route_name", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("routes").delete()
    }
}
