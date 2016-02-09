import Foundation
import CoreGraphics
import Darwin

// local: to specify the scope of code
func local(closure: ()->()) {
    closure()
}

// localAutoreleasePool: to specify the scope of code within the autorelease pool
func localAutoreleasePool(closure: ()->()) {
    autoreleasepool { () -> () in
        closure()
    }
}


var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
}


public typealias ColorComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)

public func degreesToRadians(degrees:CGFloat) -> CGFloat{
    return degrees * CGFloat(M_PI) / 180.0;
}

public func radiansToDegrees(radians:CGFloat) -> CGFloat {
    return radians * 180.0/CGFloat(M_PI);
}


