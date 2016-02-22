
**How to use SHDeviceInfo**
```swift
/**
 Provides the device type as SHDeviceType.

 Unspecified

 Phone // @available(iOS 3.2, *) iPhone and iPod touch style UI

 Pad // @available(iOS 3.2, *) iPad style UI

 TV // os(tvOS) @available(iOS 9.0, *) Apple TV style UI

 */
public enum SHDeviceType : Int {

    case Unspecified

    case Phone

    case Pad
}

public class SHDeviceInfo {

    internal var currentDevice: UIDevice

    public class var sharedInstance: SHSwiftKit.SHDeviceInfo { get }

    /// provides device status, whether it supports multitasking or not.
    public private(set) lazy var isSupportingMultitasking: Bool { get set }

    public private(set) lazy var deviceName: String! { get set }

    public private(set) lazy var systemName: String! { get set }

    /// Provides device model : @"iPhone", @"iPod touch"
    public private(set) lazy var model: String! { get set }

    /**
     Provides the device type as SHDeviceType.

     Unspecified

     Phone // @available(iOS 3.2, *) iPhone and iPod touch style UI

     Pad // @available(iOS 3.2, *) iPad style UI

     TV // os(tvOS) @available(iOS 9.0, *) Apple TV style UI

     */
    public private(set) lazy var deviceType: SHSwiftKit.SHDeviceType { get set }

    public private(set) lazy var deviceBatteryLevel: String! { get set }

    /**
     Provides the charging status in one of the below string values
     Unknown
     Unplugged // on battery, discharging
     Charging // plugged in, less than 100%
     Full // plugged in, at 100%
     */
    public private(set) lazy var chargingStatus: String! { get set }

    /**
     Check the battery status to know, if device is charging or not.
     */
    public private(set) lazy var isCharging: Bool { get set }

    /**
     Check the battery status to know if device is fully charged or not

     */
    public private(set) lazy var isFullyCharged: Bool { get set }
}
```
