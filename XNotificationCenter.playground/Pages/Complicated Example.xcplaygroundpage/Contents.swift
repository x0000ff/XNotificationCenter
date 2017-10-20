//: [Previous](@previous)

let center = NotificationCenter()

let loginNotificationListener1 = center.subscribe(forNotification: LoggedInNotification.self) { (notification) in
    print("111 Hola, \(notification.userName). Token: \(notification.accessToken)")
}

let loginNotificationListener2 = center.subscribe(forNotification: LoggedInNotification.self) { (notification) in
    print("222 Hola, \(notification.userName). Token: \(notification.accessToken)")
}

center.subscribe(forNotification: LoggedOutNotification.self) { (notification) in
    print("333 Chao, \(notification.userName)")
}

struct XXX {
    let callback: Action<LoggedInNotification>

    let internalCallback: Action<LoggedInNotification> = { n in
        print("444 Struct says hola from internal callback to \(n.userName)")
    }

    func subscribe() {
        center.subscribe(forNotification: LoggedInNotification.self, withAction: self.internalCallback)
    }

}

var x: XXX? = XXX { n in
    print("555 Struct says hola, \(n.userName)")
}
//x?.subscribe()
center.subscribe(forNotification: LoggedInNotification.self, withAction: x!.callback)

let loginNotification = LoggedInNotification(userName: "Kot", accessToken: "aaa")
center.send(notification: loginNotification)

print("#####################")

print("Remove \"loginNotificationListener2\" which was listening to \"\(loginNotificationListener2.notification)\"")
center.remove(listener: loginNotificationListener2)

//center.removeListeners(eventToRemove: LoggedInNotification.self)

print("#####################")

let logoutNotification = LoggedOutNotification(userName: "Kot")
center.send(notification: logoutNotification)

print("#####################")
x = nil

center.send(notification: loginNotification)

