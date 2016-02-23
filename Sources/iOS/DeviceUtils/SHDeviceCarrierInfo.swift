//
//  SHDeviceCarrierInfo.swift
//  SHSwiftKit
//
//  Created by Ankit Thakur on 22/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import CoreTelephony

/// Provides the device carrier information w.r.t Core Telephony
public class SHDeviceCarrierInfo {

	public class var sharedInstance: SHDeviceCarrierInfo {
		struct Singleton {
			static let instance = SHDeviceCarrierInfo()
		}
		return Singleton.instance
	}

	internal let kCellularNetworkPrefix: String = "CTRadioAccessTechnology"

	internal var carrierNetworkInfo: CTTelephonyNetworkInfo = CTTelephonyNetworkInfo()


	public private(set) lazy var hasCellularCarrier: Bool = {
		return self.carrierNetworkInfo.subscriberCellularProvider != nil
	}()


	public private(set) lazy var cellularCarrierName: String! = {
		return self.carrierNetworkInfo.subscriberCellularProvider!.carrierName
	}()

	public private(set) lazy var cellularCarrierCountry: String! = {
		return self.carrierNetworkInfo.subscriberCellularProvider!.isoCountryCode
	}()

	public private(set) lazy var cellularConnectionType: String! = {
		let radioType: String! = self.carrierNetworkInfo.currentRadioAccessTechnology!
		var cellularConnection: String = ""
		if radioType.containsString(self.kCellularNetworkPrefix) {

			let appRange: Range<String.Index> = radioType.rangeOfString(self.kCellularNetworkPrefix)!

			let startIndex = appRange.endIndex
			let newIndex: Range<String.Index> = startIndex...radioType.endIndex

			cellularConnection = radioType.substringWithRange(newIndex)

		}
		return cellularConnection
	}()

	public private(set) lazy var carrierDescription: String! = {

		var carrierdescription: String = "\(self.cellularCarrierName)-\(self.cellularCarrierCountry)"
		if self.hasCellularCarrier {
			carrierdescription.appendContentsOf("\(self.cellularConnectionType)")
		}

		carrierdescription.appendContentsOf(" \(self.cellularCarrierCountry)")

		return carrierdescription
	}()
}
