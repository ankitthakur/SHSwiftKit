# SHSwiftKit ![alt tag](https://github.com/ankitthakur/SwiftKit/blob/master/SHSwiftKit.png)

[![CI Status](http://img.shields.io/travis/ankitthakur/SHSwiftKit.svg?style=flat)](https://travis-ci.org/ankitthakur/SHSwiftKit)
[![Version](https://img.shields.io/cocoapods/v/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)
[![Platform](https://img.shields.io/cocoapods/p/SHSwiftKit.svg?style=flat)](http://cocoadocs.org/docsets/SHSwiftKit)


## Usage

```swift
/**
Create image from a view.

- parameter view: view, whose snapshot is needed.

- returns: returns a snapshot image of the view.
*/
public class func image(view: UIView) -> UIImage?

/**
Scale image to particular size

- parameter image: original image.
- parameter rect:  frame to which the original image will be resized.

- returns: resized image to particular rect.
*/
public class func image(image: UIImage, withRect rect: CGRect) -> UIImage?

/**
Crop image in square format, with size of width:width or height:height, depending on if width is smaller than height or vice-versa.

- parameter image: original image

- returns: cropped image
*/
public class func squareImage(image: UIImage) -> UIImage?

/**
Scale and crop image from original image to a particular required size.

- parameter sourceImage: original image which is needed to be scaled and cropped.
- parameter targetSize:  the size to which image needs to be scaled and cropped.

- returns: Returns an image, with target size with proper scaling and cropping.
*/
public class func scaleAndCropImage(sourceImage: UIImage, forSize targetSize: CGSize) -> UIImage?

/**
Scale and crop current image to particular required size.

- parameter targetSize: the size to which image needs to be scaled and cropped.

- returns: Returns an image, with target size with proper scaling and cropping.
*/
public func scaleAndCropImageForSize(targetSize: CGSize) -> UIImage?

/**
create image with border color

- parameter sourceImage: original image which needs border
- parameter borderColor: border color

- returns: new image with border color
*/
public class func image(sourceImage: UIImage, withBorderColor borderColor: UIColor) -> UIImage?

/**
create image with black border color

- parameter sourceImage: original image which needs border

- returns: new image with black border
*/
public class func imageWithBlackBorder(sourceImage: UIImage) -> UIImage?
```

## License

**SHSwiftKit** is available under the MIT license. See the [LICENSE](https://github.com/ankitthakur/SHSwiftKit/blob/master/LICENSE.md) file for more info.
