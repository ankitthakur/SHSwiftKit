//
//  SHAsyncManager.swift
//  SHSwiftKit
//
//  Created by ankitthakur on 02/02/16.
//  Copyright © 2016 Hyper Interaktiv AS. All rights reserved.
//

import Foundation

/** SHAsyncManager Class

*/
class SHAsyncManager {
    
    static let sharedInstance = SHAsyncManager()
    
    private init(){}
    
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
    
    
    
}
