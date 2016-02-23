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


public var globalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

public var globalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
}

public var globalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
}

public var globalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
}

public var globalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
}


public typealias ColorComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

public func degreesToRadians(degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(M_PI) / 180.0
}

public func radiansToDegrees(radians: CGFloat) -> CGFloat {
    return radians * 180.0/CGFloat(M_PI)
}
