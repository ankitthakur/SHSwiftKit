
**How to use SHDeviceInfo**
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
    public lazy var isSupportingMultitasking: Bool { get set }

    public lazy var deviceName: String! { get set }

    public lazy var systemName: String! { get set }

    /// Provides device model : @"iPhone", @"iPod touch"
    public lazy var model: String! { get set }

    /**
     Provides the device type as SHDeviceType.

     Unspecified

     Phone // @available(iOS 3.2, *) iPhone and iPod touch style UI

     Pad // @available(iOS 3.2, *) iPad style UI

     TV // os(tvOS) @available(iOS 9.0, *) Apple TV style UI

     */
    public lazy var deviceType: SHSwiftKit.SHDeviceType { get set }

    public lazy var deviceBatteryLevel: String! { get set }

    /**
     Provides the charging status in one of the below string values
     Unknown
     Unplugged // on battery, discharging
     Charging // plugged in, less than 100%
     Full // plugged in, at 100%

     - returns: returns charging status of the device
     */
    public func chargingStatus() -> String!

    /**
     Check the battery status to know, if device is charging or not.

     - returns: return bool value to validate, if device is charging or not. If it is fully charged, then also it will indicate, charging to true.
     */
    public func isCharging() -> Bool

    /**
     Check the battery status to know if device is fully charged or not

     - returns: return bool value to validate if device is fully charged or not.
     */
    public func isFullyCharged() -> Bool
}
