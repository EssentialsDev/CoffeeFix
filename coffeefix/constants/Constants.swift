//
//  Constants.swift
//  coffeefix
//
//  Created by Kasey Schlaudt on 8/31/19.
//  Copyright © 2019 Kasey Schlaudt. All rights reserved.
//

import UIKit

let COLOR_BLUE = UIColor(red:0, green:150/255, blue: 1, alpha:1.0)
let COLOR_GREY = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha:1.0)
let defaults = UserDefaults.standard

var v60AspectRatio: Int {
    get {
        let aspectRatio = defaults.integer(forKey: "v60AspectRatio")
        if aspectRatio == 0 {
            return 16
        } else {
            return aspectRatio
        }
    }
    set {
        defaults.set(newValue, forKey: "v60AspectRatio")
    }
}

var v60BloomTime: Int {
    get {
        let bloom = defaults.integer(forKey: "v60BloomTime")
        if bloom == 0 {
            return 30
        } else {
            return bloom
        }
    }
    set {
        defaults.set(newValue, forKey: "v60BloomTime")
    }
}

var v60BloomWaitTime: Int {
    get {
        let bloom = defaults.integer(forKey: "v60BloomWaitTime")
        if bloom == 0 {
            return 30
        } else {
            return bloom
        }
    }
    set {
        defaults.set(newValue, forKey: "v60BloomWaitTime")
    }
}

var v60IntervalTime: Int {
    get {
        let intervaltime = defaults.integer(forKey: "v60IntervalTime")
        if intervaltime == 0 {
            return 30
        } else {
            return intervaltime
        }
    }
    set {
        defaults.set(newValue, forKey: "v60IntervalTime")
    }
}

var v60IntervalWaitTime: Int {
    get {
        let intervaltime = defaults.integer(forKey: "v60IntervalWaitTime")
        if intervaltime == 0 {
            return 30
        } else {
            return intervaltime
        }
    }
    set {
        defaults.set(newValue, forKey: "v60IntervalWaitTime")
    }
}

var v60IntervalCount: Int {
    get {
        let intervalCount = defaults.integer(forKey: "v60IntervalCount")
        if intervalCount == 0 {
            return 3
        } else {
            return intervalCount
        }
    }
    set {
        defaults.set(newValue, forKey: "v60IntervalCount")
    }
}

var v60Coffee: Int {
    get {
        return defaults.integer(forKey: "v60Coffee")
    }
    set {
        defaults.set(newValue, forKey: "v60Coffee")
    }
}

var v60Water: Int {
    get {
        return defaults.integer(forKey: "v60Water")
    }
    set {
        defaults.set(newValue, forKey: "v60Water")
    }
}
