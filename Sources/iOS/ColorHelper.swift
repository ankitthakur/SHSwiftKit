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



public extension UIColor {
	/**
	Create UIColor from HEX string

	- parameter hexString: hex color code

	- returns: UIColor object
	*/
	func colorFromHexString(hexString: String!) -> UIColor? {
		var rgbValue: UInt64 = 0


		let newHexString = hexString.replacingOccurrences(of: "#", with: "")
		let scanner: Scanner = Scanner(string: newHexString)
		scanner.scanHexInt64(&rgbValue)

		let r: CGFloat = CGFloat((rgbValue & 0xFF0000) >> 16)/255.0
		let g: CGFloat = CGFloat((rgbValue & 0x00FF00) >> 8)/255.0
		let b: CGFloat = CGFloat(rgbValue & 0x0000FF)/255.0

		return UIColor(red: r, green: g, blue: b, alpha: 1)
	}

	/**
	Convert UIColor object to Hex Color code

	- returns: hex color code in string.
	*/
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

	/**
	Get color components (RGBA) from UIColor

	- returns: color components as RGBA.
	*/
	func colorComponents() -> ColorComponents {

		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0

		local { () -> () in
			if self.responds(to:#selector(UIColor.getRed(_:green:blue:alpha:))) {
				self.getRed(&r, green: &g, blue: &b, alpha: &a)
			} else {
				let components = self.cgColor.components
				r = (components?[0])!
				g = (components?[1])!
				b = (components?[2])!
				a = (components?[3])!
			}
		}

		return (r, g, b, a)
	}

}
