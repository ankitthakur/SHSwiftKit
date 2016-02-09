# SHSwiftKit ![alt tag](https://github.com/ankitthakur/SwiftKit/blob/master/SHSwiftKit.png)

[![CI Status](http://img.shields.io/travis/ankitthakur/SHSwiftKit.svg?style=flat)](https://travis-ci.org/ankitthakur/SHSwiftKit)
[![Version](https://img.shields.io/cocoapods/v/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)
[![Platform](https://img.shields.io/cocoapods/p/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)

## Usage

```swift
/**
Create UIColor from HEX string

- parameter hexString: hex color code

- returns: UIColor object
*/
public func colorFromHexString(hexString: String!) -> UIColor?

/**
Convert UIColor object to Hex Color code

- returns: hex color code in string.
*/
public func hexString() -> String

/**
Get color components (RGBA) from UIColor

- returns: color components as RGBA.
*/
public func colorComponents() -> SHSwiftKit.ColorComponents
```

## License

**SHSwiftKit** is available under the MIT license. See the [LICENSE](https://github.com/ankitthakur/SHSwiftKit/blob/master/LICENSE.md) file for more info.
