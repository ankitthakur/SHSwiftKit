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


public extension UIImage {

    /**
    Create image from a view.

    - parameter view: view, whose snapshot is needed.

    - returns: returns a snapshot image of the view.
    */
    class func image(view: UIView) -> UIImage? {

        var newImage: UIImage?

        localAutoreleasePool { () -> () in
            let scale: CGFloat = UIScreen.main().scale

            local(closure: { () -> () in
                UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, scale)
                view.layer.render(in: UIGraphicsGetCurrentContext()!)
                newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            })
        }

        return newImage
    }

    /**
     Scale image to particular size

     - parameter image: original image.
     - parameter rect:  frame to which the original image will be resized.

     - returns: resized image to particular rect.
     */
    class func image(image: UIImage, withRect rect: CGRect) -> UIImage? {
        let imageRef: CGImage = image.cgImage!.cropping(to: rect)!
        let croppedImage = UIImage(cgImage: imageRef)
        return croppedImage
    }

    /**
     Crop image in square format, with size of width:width or height:height, depending on if width is smaller than height or vice-versa.

     - parameter image: original image

     - returns: cropped image
     */
    class func squareImage(image: UIImage) -> UIImage? {
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

        let cropSquare = CGRect(x: xOrigin, y: yOrigin, width: edge, height: edge)

        let imageRef = image.cgImage!.cropping(to: cropSquare)
        return UIImage.init(cgImage:imageRef!, scale: UIScreen.main().scale, orientation: image.imageOrientation)
    }

    /**
     Scale and crop image from original image to a particular required size.

     - parameter sourceImage: original image which is needed to be scaled and cropped.
     - parameter targetSize:  the size to which image needs to be scaled and cropped.

     - returns: Returns an image, with target size with proper scaling and cropping.
     */
    class func scaleAndCropImage(sourceImage: UIImage, forSize targetSize: CGSize) -> UIImage? {

        var newImage: UIImage?

        let imageSize: CGSize = sourceImage.size
        let width: CGFloat = imageSize.width
        let height: CGFloat = imageSize.height
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        var scaleFactor: CGFloat = 0.0
        var scaledWidth: CGFloat = targetWidth
        var scaledHeight: CGFloat = targetHeight

        var thumbnailPoint = CGPoint(x: 0.0, y: 0.0)

        if imageSize.equalTo(targetSize) == false {
            let widthFactor = targetWidth/width
            let heightFactor = targetHeight/height

            if widthFactor > heightFactor {
                scaleFactor = widthFactor; // scale to fit height
            } else {
                scaleFactor = heightFactor; // scale to fit width
            }

            scaledWidth  = width * scaleFactor
            scaledHeight = height * scaleFactor

            // center the image
            if widthFactor > heightFactor {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            } else {
                if widthFactor < heightFactor {
                    thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
                }
            }
        }

        local { () -> () in
            UIGraphicsBeginImageContext(targetSize); // this will crop

            var thumbnailRect: CGRect  = CGRect.zero
            thumbnailRect.origin = thumbnailPoint
            thumbnailRect.size.width  = scaledWidth
            thumbnailRect.size.height = scaledHeight

            sourceImage.draw(in: thumbnailRect)

            newImage = UIGraphicsGetImageFromCurrentImageContext()
            if newImage == nil {
                NSLog("could not scale image")
            }

            //pop the context to get back to the default
            UIGraphicsEndImageContext()
        }

        return newImage
    }

    /**
     Scale and crop current image to particular required size.

     - parameter targetSize: the size to which image needs to be scaled and cropped.

     - returns: Returns an image, with target size with proper scaling and cropping.
     */
    func scaleAndCropImageForSize(targetSize: CGSize) -> UIImage? {
        return UIImage.scaleAndCropImage(sourceImage: self, forSize: targetSize)
    }

    /**
     create image with border color

     - parameter sourceImage: original image which needs border
     - parameter borderColor: border color

     - returns: new image with border color
     */
    class func image(sourceImage: UIImage, withBorderColor borderColor: UIColor) -> UIImage? {

        var newImage: UIImage?
        let size: CGSize = sourceImage.size

        localAutoreleasePool { () -> () in

            UIGraphicsBeginImageContext(size)
					let rect: CGRect = CGRect(x: 0, y:0, width: size.width, height: size.height)
            sourceImage.draw(in: rect, blendMode: .normal, alpha: 1)
            let context: CGContext  = UIGraphicsGetCurrentContext()!

            let components: ColorComponents = borderColor.colorComponents()
            context.setStrokeColor(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
            context.stroke(rect)
            newImage =  UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }

        return newImage
    }

    /**
     create image with black border color

     - parameter sourceImage: original image which needs border

     - returns: new image with black border
     */
    class func imageWithBlackBorder(sourceImage: UIImage) -> UIImage? {

			return UIImage.image(sourceImage: sourceImage, withBorderColor: UIColor.black())
    }
}
