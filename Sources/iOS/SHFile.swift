//
//  SHFile.swift
//  SHSwiftKit
//
//  Created by Ankit Thakur on 06/03/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import Foundation


public class SHFile: NSObject {

	public var displayName:String?
	public var creationDate:NSDate?
	public var modificationDate:NSDate?

	class func file(filePath:String!) -> (session: SHFile?, error: NSError?){

		let file:SHFile = SHFile()
		var error:NSError?

		let manager = FileManager.default()

		if manager.fileExists(atPath: filePath) {
			do {
				print("------------ file path \(filePath)")

				let attributes:[String : AnyObject] = try manager.attributesOfItem(atPath: filePath)
				file.creationDate = attributes[FileAttributeKey.creationDate.rawValue] as? NSDate
				file.modificationDate = attributes[FileAttributeKey.modificationDate.rawValue] as? NSDate
				file.displayName = NSURL(string: filePath)!.lastPathComponent
			}
			catch let exception{
				print(exception)
				//error = [NSError errorWithDomain:@"File Manager" code:1200 userInfo:@{NSLocalizedDescriptionKey:@"File does not exist at provided path"}];
				error = NSError(domain: FILEMANAGER_ERROR_DOMAIN, code: FILE_NOT_FOUND, userInfo: [NSLocalizedDescriptionKey:FILE_NOT_FOUND_MESSAGE])
			}
		}

		return (file, error);
	}

	public class func installedApps() -> ((Int, [String]), NSError?){

		do {
			let filePath = "/"

			var error:NSError?

			var numberOfApps:Int = 0;
			var apps:[String] = [];

			let manager = FileManager.default()

			if manager.fileExists(atPath: filePath) {

				let subpaths:[String] = manager.subpaths(atPath: filePath)!;
				for path in subpaths{
					print(path)
					do {
						print("------------ file path \(filePath)")

						let attributes = try manager.attributesOfItem(atPath: filePath)

						print("NSFileCreationDate \(attributes[FileAttributeKey.creationDate.rawValue] as? NSDate)")
					}
					catch let exception{
						print(exception)
						//error = [NSError errorWithDomain:@"File Manager" code:1200 userInfo:@{NSLocalizedDescriptionKey:@"File does not exist at provided path"}];
						error = NSError(domain: FILEMANAGER_ERROR_DOMAIN, code: FILE_NOT_FOUND, userInfo: [NSLocalizedDescriptionKey:FILE_NOT_FOUND_MESSAGE])
					}

				}
				for subpath:String in subpaths {
					if subpath.hasSuffix(".app"){
						//print("\n")
						let fullpath = "\(filePath)/\(subpath)"


						if(!subpath.hasSuffix("Service.app") &&
							!subpath.hasSuffix("Dialog.app") &&
							!subpath.hasSuffix("WebContentAnalysisUI.app") &&
							!subpath.hasSuffix("iAdOptOut.app") &&
							!subpath.hasSuffix("Diagnostics.app") &&
							!subpath.hasSuffix("quicklookd.app") &&
							!subpath.hasSuffix("PreBoard.app") &&
							!subpath.hasSuffix("Preferences.app") &&
							!subpath.hasSuffix("Print Center.app") &&
							!subpath.hasSuffix("PrintStatus.app") &&
							!subpath.hasSuffix("SLGoogleAuth.app") &&
							!subpath.hasSuffix("ShareBear.app") &&
							!subpath.hasSuffix("WebApp1.app") &&
							!subpath.hasSuffix("WebContentAnalysisUI.app") &&
							!subpath.hasSuffix("WebSheet.app") &&
							!subpath.hasSuffix("GameController.app") &&
							!subpath.hasSuffix("Feedback Assistant iOS.app") &&
							!subpath.hasSuffix("AskPermissionUI.app") &&
							!subpath.hasSuffix("CoreAuthUI.app") &&
							!subpath.hasSuffix("Bridge.app") &&
							!subpath.hasSuffix("MobileReplayer.app")){
							print("\(manager.displayName(atPath: fullpath))")
							numberOfApps += 1;
							apps.append(subpath)
						}
					}
				}
			}
			else {
				error = NSError(domain: FILEMANAGER_ERROR_DOMAIN, code: APPS_NOT_FOUND, userInfo: [NSLocalizedDescriptionKey:APPS_NOT_FOUND_MESSAGE])
			}
			
			return ((numberOfApps, apps), error)
		}
		catch let exception{
			print(exception)
			//error = [NSError errorWithDomain:@"File Manager" code:1200 userInfo:@{NSLocalizedDescriptionKey:@"File does not exist at provided path"}];
			error = NSError(domain: FILEMANAGER_ERROR_DOMAIN, code: FILE_NOT_FOUND, userInfo: [NSLocalizedDescriptionKey:FILE_NOT_FOUND_MESSAGE])
			return (nil, error)
		}
	}

}
