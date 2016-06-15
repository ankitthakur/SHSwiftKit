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
		if radioType.contains(self.kCellularNetworkPrefix) {

			guard let appRange: Range = radioType.range(of:self.kCellularNetworkPrefix)!
				else{
					return cellularConnection
			}

			cellularConnection = radioType.substring(from: appRange.upperBound)

		}
		return cellularConnection
	}()

	public private(set) lazy var carrierDescription: String! = {

		var carrierdescription: String = "\(self.cellularCarrierName)-\(self.cellularCarrierCountry)"
		if self.hasCellularCarrier {
			carrierdescription.append("\(self.cellularConnectionType)")
		}

		carrierdescription.append(" \(self.cellularCarrierCountry)")

		return carrierdescription
	}()
}
