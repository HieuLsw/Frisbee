public enum Result<Entity> {
    case success(Entity)
    case fail(FrisbeeError)
}

extension Result {
    public var data: Entity? {
        guard case let .success(data) = self else {
            return nil
        }
        return data
    }

    public var error: FrisbeeError? {
        guard case let .fail(error) = self else {
            return nil
        }
        return error
    }
}

extension Result: Equatable {
    public static func == (lhs: Result, rhs: Result) -> Bool {
        switch (lhs, rhs) {
        case let (.fail(lhs), .fail(rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}

extension Result where Entity: Equatable {
    public static func == (lhs: Result, rhs: Result) -> Bool {
        switch (lhs, rhs) {
        case let (.success(lhs), .success(rhs)):
            return lhs == rhs
        case let (.fail(lhs), .fail(rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}
