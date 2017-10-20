import Foundation

public typealias NotificationName = String

public protocol Notification {
    static var name: NotificationName { get }
}

public extension Notification {
    public static var name: NotificationName { return "\(self)" }
}

public typealias Action<T: Notification> = ((T) -> ())

public class NotificationListener<T: Notification> {

    let action: Action<T>?
    public let notification: T.Type

    init(notification: T.Type, callback: @escaping Action<T>) {
        self.action = callback
        self.notification = notification
    }
}

public class XNotificationCenter {

    var listeners = Dictionary<NotificationName, NSMutableArray>()

    public init() { }

    public func subscribe<T: Notification>(forNotification notification: T.Type, withAction action: @escaping Action<T>) -> NotificationListener<T> {
        let newListener = NotificationListener<T>(notification: notification, callback: action)
        add(listener: newListener, forNotification: notification.self)

        return newListener
    }

    internal func add<T>(listener: NotificationListener<T>, forNotification notification: T.Type) {
        if let listenersArray = listeners[notification.name] {
            listenersArray.add(listener)
        }
        else {
            listeners[notification.name] = [listener] as NSMutableArray
        }
    }

    public func remove<T>(listener: NotificationListener<T>) {
        let notificationNameToRemove = listener.notification.name
        listeners[notificationNameToRemove]?.remove(listener)
    }

    public func removeAllListeners() {
        listeners.removeAll()
    }

    // Remove listeners for a specific notification
    public func removeListeners<T: Notification>(ofNotification notification: T.Type) {

        listeners.removeValue(forKey: notification.name)
    }

    public func send<T: Notification>(notification: T) {

        guard let actionListeners = self.listeners[T.name] else {
            return
        }

        for listener in actionListeners {
            guard let actionToPerform = listener as? NotificationListener<T> else {
                continue
            }

            if let methodToCall = actionToPerform.action {
                methodToCall(notification)
            }
        }
    }
}

