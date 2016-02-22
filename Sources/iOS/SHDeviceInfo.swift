//
//  SHDeviceInfo.swift
//  SHSwiftKit
//
//  Created by Ankit Thakur on 21/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import CoreTelephony
import Darwin
import UIKit

public enum SHDeviceType : Int {
    
    case Unspecified
    @available(iOS 3.2, *)
    case Phone // iPhone and iPod touch style UI
    @available(iOS 3.2, *)
    
    case Pad // iPad style UI
    #if os(tvOS)
    @available(iOS 9.0, *)
    case TV // Apple TV style UI
    #endif
}

class SHDeviceInfo {
    
    var currentDevice:UIDevice = UIDevice.currentDevice();
    
    class var sharedInstance: SHDeviceInfo {
        struct Singleton {
            static let instance = SHDeviceInfo()
        }
        return Singleton.instance
    }
    
    func isSupportingMultitasking() -> Bool {
        
        let isMultitasking = currentDevice.multitaskingSupported
        return isMultitasking
        
    }
    
    //public var localizedModel: String { get } // localized version of model
    //public var systemVersion: String { get } // e.g. @"4.0"
    
    // e.g. "My iPhone"
    func deviceName()-> String! {
        return currentDevice.name
    }
    
    // e.g. @"iOS"
    func systemName() -> String! {
        return currentDevice.systemName
    }
    
    // e.g. @"iPhone", @"iPod touch"
    func model() -> String! {
        return currentDevice.model
    }
    
    func deviceType() -> SHDeviceType{
        let idiom:UIUserInterfaceIdiom  = currentDevice.userInterfaceIdiom;
        var deviceType:SHDeviceType = .Unspecified;
        
        switch (idiom) {
        case .Unspecified:
            deviceType = .Unspecified
            break
        case .TV:
            
            #if os(tvOS)
                deviceType = .TV
            #else
                // Fallback on other platform
                deviceType = .Unspecified
            #endif
            break
        case .Pad:
            deviceType = .Pad
            break
        case .Phone:
            deviceType = .Phone
            break
        }
        
        return deviceType;
    }
    
    // e.g. "0.55" for 55% battery
    func deviceBatteryLevel() -> String! {
        
        var batteryLevel:String = "Not available";
        
        if (currentDevice.batteryLevel >= 0.0){
            batteryLevel = "\(currentDevice.batteryLevel)"
        }
        
        return batteryLevel;
    }
    
    /* e.g.
    case Unknown
    case Unplugged // on battery, discharging
    case Charging // plugged in, less than 100%
    case Full // plugged in, at 100%
    */
    func chargingStatus() -> String! {
        
        var status:String = "Unknown";
        
        switch (currentDevice.batteryState){
        case .Unknown:
            break
        case .Unplugged:
            status = "Unplugged"
            break
        case .Charging:
            status = "Charging"
        case .Full: 
            status = "Full"
        }
        
        return status;
    }
    
    
}
