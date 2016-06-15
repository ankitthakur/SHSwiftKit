import Foundation
import CoreGraphics
import Darwin

// local: to specify the scope of code
public func local(closure: ()->()) {
    closure()
}

// localAutoreleasePool: to specify the scope of code within the autorelease pool
public func localAutoreleasePool(closure: ()->()) {
    autoreleasepool { () -> () in
        closure()
    }
}


public var globalMainQueue: DispatchQueue {
    return DispatchQueue.main
}

public var globalUserInteractiveQueue: DispatchQueue {
    return DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosUserInteractive)
}

public var globalUserInitiatedQueue: DispatchQueue {
    return DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosUserInitiated)
}

public var globalUtilityQueue: DispatchQueue {
    return DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosUtility)
}

public var globalBackgroundQueue: DispatchQueue {
    return DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosBackground)
}


public typealias ColorComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

public func degreesToRadians(degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(M_PI) / 180.0
}

public func radiansToDegrees(radians: CGFloat) -> CGFloat {
    return radians * 180.0/CGFloat(M_PI)
}
