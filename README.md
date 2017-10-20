# Custom Notification Center

## Why?

- Avoid string-based notificaiton syntax

## Highlights

- 🐧 Swift
- 🏰 Strong typed
- 🎭 Extandable


## How to...

### Create new type of notification

You can add any properties you need.

```swift
public struct NewUserNotification: Notification {
    public let userName: String

    public init(userName: String) {
        self.userName = userName
    }
}
```

### Create instance of Notification Center

```swift
let notificationCenter = NotificationCenter()
```

### Create listener 

```swift
let listener = notificationCenter.subscribe(forNotification: NewUserNotification.self) { (notification) in
    print("Hi, \(notification.userName)")
}
```

### Send notification


```swift
// Create an instance
let notification = NewUserNotification(userName: "Admin")

// And send it
notificationCenter.send(notification: notification)
```

### Remove specific listener


```swift
//: Remove listener
notificationCenter.remove(listener: listener)
```

### Remove all listeners of some notification type

```swift
notificationCenter.removeListeners(ofNotification: NewUserNotification.self)
```

### Remove all listeners for all the notificaitons

```swift
notificationCenter.removeAllListeners()
```