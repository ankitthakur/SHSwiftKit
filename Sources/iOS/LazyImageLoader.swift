//
//  LazyImageLoader.swift
//  SHSwiftKit
//
//  Created by ankitthakur on 03/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import Foundation


typealias ImageCallback = (imageData: NSData?, imageTempDirPath:String?, error:NSError?) -> Void
class LazyImageLoader: NSObject {
    
    func loadImageWithUrl(url:String!, callback:ImageCallback){
        let manager:SHNetworkManager = SHNetworkManager.sharedInstance;
        let media:MediaType = .Data(url, nil);
        
//        let data = nil;
        
        manager.requestWithUrl(media) { (data: NSData?, userInfo: [NSObject : AnyObject]?, error:NSError?) -> Void in
            callback(imageData: data, imageTempDirPath: nil, error: error);
        };
    }
    
}