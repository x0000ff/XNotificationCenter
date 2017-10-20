public struct LoggedInNotification: Notification {
    
    public init(userName: String, accessToken: String) {
        self.userName = userName
        self.accessToken = accessToken
    }
    
    //    static var name: NotificationName { return "\(self)" }
    //    static let name: NotificationName = "LoggedInNotification"
    public let userName: String
    public let accessToken: String
}

public struct LoggedOutNotification: Notification {
    public let userName: String
    
    public init(userName: String) {
        self.userName = userName
    }
}
