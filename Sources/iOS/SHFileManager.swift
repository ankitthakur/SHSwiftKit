//
//  SHFileManager.swift
//  SHSwiftKit
//
//  Created by Ankit Thakur on 06/03/16.
//  Copyright © 2016 AnkitThakur. All rights reserved.
//

import Foundation

let kSystemDirectory_System                 = "/System";
let kSystemDirectory_Applications           = "/Applications";
let kSystemDirectory_tmp                    = "/tmp";
let kSystemDirectory_var                    = "/var";
let kSystemDirectory_Developer_Tools        = "/Developer/Tools";
let kSystemDirectory_Developer_Applications = "/Developer/Applications";
let kSystemDirectory_App_Containers         = "/private/var/mobile/Containers/Data/Application/";
let kSystemDirectory_Private                = "/private";

let kSystemDirectory_Cores                  = "/cores";
let kSystemDirectory_etc                    = "/etc";
let kSystemDirectory_home                   = "/home";
let kSystemDirectory_net                    = "/net";
let kSystemDirectory_opt                    = "/opt";
let kSystemDirectory_private                = "/private";
let kSystemDirectory_Library                = "/Library";
let kSystemDirectory_Network                = "/Network";
let kSystemDirectory_usr                    = "/usr";
let kSystemDirectory_Users                  = "/Users";

public class SHFileManager {
	
	public class var sharedInstance: SHFileManager {
		struct Singleton {
			static let instance = SHFileManager()
		}
		return Singleton.instance
	}

	public var systemDirectories = [kSystemDirectory_System, kSystemDirectory_Applications,
		kSystemDirectory_tmp, kSystemDirectory_var, kSystemDirectory_Developer_Tools, kSystemDirectory_Developer_Applications];

	public class func file(filePath:String!) -> (session: SHFile?, error: NSError?){
		return SHFile.file(filePath: filePath);
	}

	public class func numberOfApps() -> ((Int, [String]), NSError?){
		return SHFile.installedApps()
	}
}
