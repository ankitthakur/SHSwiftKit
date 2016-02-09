# SHSwiftKit ![alt tag](https://github.com/ankitthakur/SwiftKit/blob/master/SHSwiftKit.png)

[![CI Status](http://img.shields.io/travis/ankitthakur/SHSwiftKit.svg?style=flat)](https://travis-ci.org/ankitthakur/SHSwiftKit)
[![Version](https://img.shields.io/cocoapods/v/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)
[![Platform](https://img.shields.io/cocoapods/p/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)

## Description

**SHSwiftKit** description.

## Usage

```swift
[![local closure](http://ankitthakur.github.io/blog/swift/scope/2016/02/08/localScope.html)]
// global closures
public func local(closure: () -> ())
public func localAutoreleasePool(closure: () -> ())

global variables
public var GlobalMainQueue: dispatch_queue_t { get }
public var GlobalUserInteractiveQueue: dispatch_queue_t { get }
public var GlobalUserInitiatedQueue: dispatch_queue_t { get }
public var GlobalUtilityQueue: dispatch_queue_t { get }
public var GlobalBackgroundQueue: dispatch_queue_t { get }

// public tuple for color components
public typealias ColorComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

// global functions
public func degreesToRadians(degrees: CGFloat) -> CGFloat
public func radiansToDegrees(radians: CGFloat) -> CGFloat


```

## Author

Ankit Thakur, ankitthakur85@icloud.com

## Installation

**SHSwiftKit** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SHSwiftKit'
```

**SHSwiftKit** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "ankitthakur/SHSwiftKit"
```

## Author

Ankit Thakur, ankitthakur85@icloud.com

## Contributing

We would love you to contribute to **SHSwiftKit**, check the [CONTRIBUTING](https://github.com/ankitthakur/SHSwiftKit/blob/master/CONTRIBUTING.md) file for more info.

## License

**SHSwiftKit** is available under the MIT license. See the [LICENSE](https://github.com/ankitthakur/SHSwiftKit/blob/master/LICENSE.md) file for more info.
