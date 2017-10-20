![Swift 4.0](https://img.shields.io/badge/Swift-4.0-brightgreen.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Status](https://img.shields.io/badge/Status-alpha-orange.svg)

<p align="center">
  <img alt="I’m Going To Build My Own Theme Park" src="./img/bender.jpg" width="50%" border="1px black"/>
</p>

# X Notification Center

My type-safe Notifications with Blackjack and Hookers

| ⭐️ | Key Features |
|----|--------------|
| 🐧 | Swift 4.0    |
| 🏰 | Strong typed |
| 🎭 | Extendable   |

## Why?

- Avoid string-based notification syntax 😡
- Avoid casting magic in notification handlers 🤢

```swift
func userNotificationCenter(center: NSUserNotificationCenter!, didActivateNotification notification: NSUserNotification!) {
        let userInfo:Dictionary<String,String!> = notification.userInfo as! Dictionary<String,String!>

    guard let type = userInfo["type"] as? String else {
            print("It can't be :(")        
    }
      
    if type == "LoggedIn" {
        guard let accessToken = userInfo["accessToken"] as? String else {
            print("It can't be :(")        
        }
    }
}  
```

## Installation

Copy [XNotificationCenter.swift](./XNotificationCenter.playground/Sources/XNotificationCenter.swift) to your project 

## Usage

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
let notificationCenter = XNotificationCenter()
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

### For more examples...

see [XNotificationCenter.playground](./XNotificationCenter.playground)