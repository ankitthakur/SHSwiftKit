//
//  SHDeviceCarrierInfo.swift
//  SHSwiftKit
//
//  Created by Ankit Thakur on 22/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

/// Provides the device carrier information w.r.t Core Telephony
class SHDeviceCarrierInfo {
    
    class var sharedInstance: SHDeviceCarrierInfo {
        struct Singleton {
            static let instance = SHDeviceCarrierInfo()
        }
        return Singleton.instance
    }
    
}
