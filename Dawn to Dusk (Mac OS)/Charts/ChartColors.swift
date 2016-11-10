//
//  ChartColors.swift
//
//  Created by Giampaolo Bellavite on 07/11/14.
//  Copyright (c) 2014 Giampaolo Bellavite. All rights reserved.
//

import Cocoa

/**
Shorthands for various colors to use freely in the charts.
*/
public struct ChartColors {
    static fileprivate func colorFromHex(_ hex: Int) -> NSColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0

        return NSColor(red: red, green: green, blue: blue, alpha: 1)
    }

    static public func blueColor() -> NSColor {
        return colorFromHex(0x4A90E2)
    }
    static public func orangeColor() -> NSColor {
        return colorFromHex(0xF5A623)
    }
    static public func greenColor() -> NSColor {
        return colorFromHex(0x7ED321)
    }
    static public func darkGreenColor() -> NSColor {
        return colorFromHex(0x417505)
    }
    static public func redColor() -> NSColor {
        return colorFromHex(0xFF3200)
    }
    static public func darkRedColor() -> NSColor {
        return colorFromHex(0xD0021B)
    }
    static public func purpleColor() -> NSColor {
        return colorFromHex(0x9013FE)
    }
    static public func maroonColor() -> NSColor {
        return colorFromHex(0x8B572A)
    }
    static public func pinkColor() -> NSColor {
        return colorFromHex(0xBD10E0)
    }
    static public func greyColor() -> NSColor {
        return colorFromHex(0x7f7f7f)
    }
    static public func cyanColor() -> NSColor {
        return colorFromHex(0x50E3C2)
    }
    static public func goldColor() -> NSColor {
        return colorFromHex(0xbcbd22)
    }
    static public func yellowColor() -> NSColor {
        return colorFromHex(0xF8E71C)
    }
}
