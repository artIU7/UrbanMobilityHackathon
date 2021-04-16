import Fluent
import Vapor

final class Route: Model, Content {
    static let schema = "routes"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "route_id")
    var route_id: String
    
    @Field(key: "route_name")
    var route_name: String

    init() { }

    init(id: UUID? = nil, route_id: String, route_name : String) {
        self.id = id
        self.route_id = route_id
        self.route_name = route_name
    }
}
