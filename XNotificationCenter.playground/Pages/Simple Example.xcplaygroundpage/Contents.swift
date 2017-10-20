//: Simple example of Custom Notification Center

public struct NewUserNotification: Notification {
    public let userName: String

    public init(userName: String) {
        self.userName = userName
    }
}

//: Create XNotificationCenter instance
let notificationCenter = XNotificationCenter()

//: Add a new listener
let listener = notificationCenter.subscribe(forNotification: NewUserNotification.self) { (notification) in
    print("Hi, \(notification.userName)")
}

//: Send notification
let notification = NewUserNotification(userName: "Admin")
notificationCenter.send(notification: notification)

//: Remove listener
notificationCenter.remove(listener: listener)

//: Remove all listeners of some notification type
notificationCenter.removeListeners(ofNotification: NewUserNotification.self)

//: Remove all listeners for all the notificaitons
notificationCenter.removeAllListeners()

//: [Next](@next)
