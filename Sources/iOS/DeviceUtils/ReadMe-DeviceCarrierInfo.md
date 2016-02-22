**HOW TO USE DeviceCarrierInformation**
``` swift
/// Provides the device carrier information w.r.t Core Telephony
public class SHDeviceCarrierInfo {

    public class var sharedInstance: SHSwiftKit.SHDeviceCarrierInfo { get }

    internal let kCellularNetworkPrefix: String

    internal var carrierNetworkInfo: CTTelephonyNetworkInfo

    public private(set) lazy var hasCellularCarrier: Bool { get set }

    public private(set) lazy var cellularCarrierName: String! { get set }

    public private(set) lazy var cellularCarrierCountry: String! { get set }

    public private(set) lazy var cellularConnectionType: String! { get set }

    public private(set) lazy var carrierDescription: String! { get set }
}
```
