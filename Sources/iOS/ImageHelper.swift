//
//  ImageHelper.swift
//  SHSwiftKit
//
//  Created by ankitthakur on 08/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

public extension UIImage{
    
    // create image from view
    class func image(view:UIView) -> UIImage{
        
        var newImage:UIImage?
        
        localAutoreleasePool { () -> () in
            var scale:CGFloat = 1.0
            if UIScreen.mainScreen().respondsToSelector("scale"){
                scale = UIScreen.mainScreen().scale;
            }
            
            local({ () -> () in
                UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, scale)
                view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
                newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            })
        }
        
        return newImage!;
    }
    
    class func image(image:UIImage, withRect rect:CGRect) -> UIImage{
        let imageRef:CGImageRef = CGImageCreateWithImageInRect(image.CGImage, rect)!;
        let croppedImage = UIImage(CGImage: imageRef);
        return croppedImage;
    }
    
    class func squareImage(image: UIImage) -> UIImage {
        let originalWidth  = image.size.width
        let originalHeight = image.size.height
        
        var edge: CGFloat
        if originalWidth > originalHeight {
            edge = originalHeight
        } else {
            edge = originalWidth
        }
        
        let xOrigin = (originalWidth  - edge) / 2.0
        let yOrigin = (originalHeight - edge) / 2.0
        
        let cropSquare = CGRectMake(xOrigin, yOrigin, edge, edge)
        
        let imageRef = CGImageCreateWithImageInRect(image.CGImage, cropSquare);
        return UIImage(CGImage: imageRef!, scale: UIScreen.mainScreen().scale, orientation: image.imageOrientation)
    }
}