//
//  ColorHelper.swift
//  SHSwiftKit
//
//  Created by ankitthakur on 09/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics



public extension UIColor{
    
    func colorFromHexString(hexString:String!)->UIColor?
    {
        var rgbValue:UInt64 = 0;
        
        let newHexString = hexString.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner:NSScanner = NSScanner(string: newHexString)
        scanner.scanHexLongLong(&rgbValue)
        
        let r: CGFloat = CGFloat((rgbValue & 0xFF0000) >> 16)/255.0
        let g: CGFloat = CGFloat((rgbValue & 0x00FF00) >> 8)/255.0
        let b: CGFloat = CGFloat(rgbValue & 0x0000FF)/255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    func hexString() -> String {
        let rgbaT = self.colorComponents()
        let r: Int = Int(rgbaT.red * 255)
        let g: Int = Int(rgbaT.green * 255)
        let b: Int = Int(rgbaT.blue * 255)
        let red = NSString(format: "%02x", r)
        let green = NSString(format: "%02x", g)
        let blue = NSString(format: "%02x", b)
        return "#\(red)\(green)\(blue)"
    }
    

    func colorComponents() -> ColorComponents {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        local { () -> () in
            if self.respondsToSelector("getRed:green:blue:alpha:") {
                self.getRed(&r, green: &g, blue: &b, alpha: &a)
            } else {
                let components = CGColorGetComponents(self.CGColor)
                r = components[0]
                g = components[1]
                b = components[2]
                a = components[3]
            }
        }
        
        return (r, g, b, a)
    }

}
