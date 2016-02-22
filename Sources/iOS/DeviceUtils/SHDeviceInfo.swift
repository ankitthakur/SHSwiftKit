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

/**
 Provides the device type as SHDeviceType.
 
 Unspecified
 
 Phone // @available(iOS 3.2, *) iPhone and iPod touch style UI
 
 Pad // @available(iOS 3.2, *) iPad style UI
 
 TV // os(tvOS) @available(iOS 9.0, *) Apple TV style UI
 
 */

public enum SHDeviceType : Int {
    
    case Unspecified
    // iPhone and iPod touch style UI
    @available(iOS 3.2, *)
    case Phone
    // iPad style UI
    @available(iOS 3.2, *)
    case Pad
    #if os(tvOS)
    // Apple TV style UI
    @available(iOS 9.0, *)
    case TV
    #endif
}

public class SHDeviceInfo {
    
    var currentDevice:UIDevice = UIDevice.currentDevice();
    
    public class var sharedInstance: SHDeviceInfo {
        struct Singleton {
            static let instance = SHDeviceInfo()
        }
        return Singleton.instance
    }
    
    /// provides device status, whether it supports multitasking or not.
    public lazy var isSupportingMultitasking: Bool = {
        
        let isMultitasking = self.currentDevice.multitaskingSupported
        return isMultitasking
        
    }()
    
    // Provides device name e.g. "My iPhone"
    public lazy var deviceName:String! = {
        return self.currentDevice.name
    }()
    
    // Provides device system-name e.g. @"iOS"
    public lazy var systemName: String! = {
        return self.currentDevice.systemName
    }()
    
    /// Provides device model : @"iPhone", @"iPod touch"
    public lazy var model: String! = {
        return self.currentDevice.model
    }()
    
    /**
     Provides the device type as SHDeviceType.
     
     Unspecified
     
     Phone // @available(iOS 3.2, *) iPhone and iPod touch style UI
     
     Pad // @available(iOS 3.2, *) iPad style UI
     
     TV // os(tvOS) @available(iOS 9.0, *) Apple TV style UI
     
     */
    public lazy var deviceType: SHDeviceType = {
        let idiom:UIUserInterfaceIdiom  = self.currentDevice.userInterfaceIdiom;
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
    }()
    
    // Provides device battery level in string e.g. "0.55" for 55% battery, if not available, it provides "Not available"
    public lazy var deviceBatteryLevel: String! = {
        
        var batteryLevel:String = "Not available";
        
        if (self.currentDevice.batteryLevel >= 0.0){
            batteryLevel = "\(self.currentDevice.batteryLevel)"
        }
        
        return batteryLevel;
    }()
    
    
    /**
     Provides the charging status in one of the below string values
     Unknown
     Unplugged // on battery, discharging
     Charging // plugged in, less than 100%
     Full // plugged in, at 100%
     
     - returns: returns charging status of the device
     */
    public func chargingStatus() -> String! {
        
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
    
    /**
     Check the battery status to know, if device is charging or not.
     
     - returns: return bool value to validate, if device is charging or not. If it is fully charged, then also it will indicate, charging to true.
     */
    public func isCharging() -> Bool{
        
        var chargingStatus = false;
        
        switch(currentDevice.batteryState){
        case .Unknown:
            break;
        case .Unplugged:
            break;
        case .Charging:
            chargingStatus = true;
        case .Full:
            chargingStatus = true;
        }
        
        return chargingStatus;
    }
    
    /**
     Check the battery status to know if device is fully charged or not
     
     - returns: return bool value to validate if device is fully charged or not.
     */
    public func isFullyCharged() -> Bool{
        
        var chargingStatus = false;
        
        switch(currentDevice.batteryState){
        case .Unknown, .Unplugged, .Charging:
            break
        case .Full:
            chargingStatus = true;
            break
        }
        
        return chargingStatus;
    }
    
    
}
