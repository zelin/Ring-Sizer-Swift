/*
 * Copyright (c) 2018 Muhammad Umar (https://github.com/zelin)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
 * associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 * OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

//
//  DeviceType.swift
//  RingSizerSwift
//
//  Created by Muhammad Umar on 07/07/2018.
//  Copyright © 2018 Neberox Technologies. All rights reserved.
//
// 1. Declare outside class definition (or in its own file).
// 2. UIKit must be included in file where this code is added.
// 3. Extends UIDevice class, thus is available anywhere in app.
//
// Usage example:
//
//    if UIDevice().type == .simulator {
//       print("You're running on the simulator... boring!")
//    } else {
//       print("Wow! Running on a \(UIDevice().type.rawValue)")
//    }

import Foundation
import UIKit

public enum Model : String
{
    case simulator   = "simulator/sandbox",
    iPod1            = "iPod 1",
    iPod2            = "iPod 2",
    iPod3            = "iPod 3",
    iPod4            = "iPod 4",
    iPod5            = "iPod 5",
    iPad2            = "iPad 2",
    iPad3            = "iPad 3",
    iPad4            = "iPad 4",
    iPhone4          = "iPhone 4",
    iPhone4S         = "iPhone 4S",
    iPhone5          = "iPhone 5",
    iPhone5S         = "iPhone 5S",
    iPhone5C         = "iPhone 5C",
    iPadMini1        = "iPad Mini 1",
    iPadMini2        = "iPad Mini 2",
    iPadMini3        = "iPad Mini 3",
    iPadAir1         = "iPad Air 1",
    iPadAir2         = "iPad Air 2",
    iPadPro9_7       = "iPad Pro 9.7\"",
    iPadPro9_7_cell  = "iPad Pro 9.7\" cellular",
    iPadPro10_5      = "iPad Pro 10.5\"",
    iPadPro10_5_cell = "iPad Pro 10.5\" cellular",
    iPadPro12_9      = "iPad Pro 12.9\"",
    iPadPro12_9_cell = "iPad Pro 12.9\" cellular",
    iPhone6          = "iPhone 6",
    iPhone6plus      = "iPhone 6 Plus",
    iPhone6S         = "iPhone 6S",
    iPhone6Splus     = "iPhone 6S Plus",
    iPhoneSE         = "iPhone SE",
    iPhone7          = "iPhone 7",
    iPhone7plus      = "iPhone 7 Plus",
    iPhone8          = "iPhone 8",
    iPhone8plus      = "iPhone 8 Plus",
    iPhoneX          = "iPhone X",
    unrecognized     = "?unrecognized?"
}

public extension UIDevice
{
    // in millimeters
    public var pointConversion : CGFloat
    {
        let mType : Model = Model.iPhone6S //type;
        // mm / screen width
        if mType == .iPad2 {
            return 147.828/768 // 9.7 inch  1024 by 768
        }else if mType == .iPad3 {
            return 147.828/768 // 9.7 inch 1536 x 2048
        }else if mType == .iPad4 {
            return 147.828/768 // 9.7 inch 1536 x 2048
        }else if mType == .iPhone4 {
            return 49.31285/320// 4 inch
        }else if mType == .iPhone4S {
            return 49.31285/320// 4 inch
        }else if mType == .iPhone5 {
            return 49.86972/320  // 4 inch
        }else if mType == .iPhone5C {
            return 49.86972/320  // 4 inch
        }else if mType == .iPhone5S {
            return 49.86972/320  // 4 inch
        }else if mType == .iPhone6 {
            return 58.505164/375 // 4.7 inch
        }else if mType == .iPhone6S {
            return 58.505164/375 // 4.7 inch
        }else if mType == .iPhone7 {
            return 58.505164/375 // 4.7 inch
        }else if mType == .iPhone6plus {
            return 68.463490/375 // 5.5 inch
        }else if mType == .iPhone6Splus {
            return 68.463490/375 // 5.5 inch
        }else if mType == .iPhoneSE {
            return 49.86972/320  // 4 inch
        }else if mType == .iPhone7plus {
            return 68.489495/414
        }else if mType == .iPhone8plus {
            return 68.489495/414
        }else if mType == .iPhone8 {
            return 58.505164/375
        }else if mType == .iPhoneX {
            return 61.766984/375 // 5.8 inch
        }else if mType == .iPadMini1 {
            return 120.396/768 //  7.9 inch 1024 x 768
        }else if mType == .iPadMini2 {
            return 120.396/768 //  7.9 inch 2048×1536
        }else if mType == .iPadMini3 {
            return 120.396/768 //  7.9 inch 2048×1536
        }else if mType == .iPadAir1 {
            return 120.396/768 // 9.7 inch 1536 x 2048
        }else if mType == .iPadAir2 {
            return 120.396/768// 9.7 inch 1536 x 2048
        }else if mType == .iPadPro9_7 {
            return 120.74470/375
        }else if mType == .iPadPro9_7_cell {
            return 120.74470/375
        }else if mType == .iPadPro10_5 {
            return 160.02/834 // 1112 x 834 10.5
        }else if mType == .iPadPro10_5_cell {
            return 160.02/834 // 1112 x 834  10.5
        }else if mType == .iPadPro12_9 {
            return 196.5346/1024 // 1024 x 1366   12.9
        }else if mType == .iPadPro12_9_cell {
            return 196.5346/1024 // 1024 x 1366 12.9
        }else {
            return 0
        }
    }
    
    public var type: Model
    {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine)
        {
            $0.withMemoryRebound(to: CChar.self, capacity: 1)
            {
                ptr in String.init(validatingUTF8: ptr)
            }
        }

        var modelMap : [ String : Model ] = [
            "i386"       : .simulator,
            "x86_64"     : .simulator,
            "iPod1,1"    : .iPod1,
            "iPod2,1"    : .iPod2,
            "iPod3,1"    : .iPod3,
            "iPod4,1"    : .iPod4,
            "iPod5,1"    : .iPod5,
            "iPad2,1"    : .iPad2,
            "iPad2,2"    : .iPad2,
            "iPad2,3"    : .iPad2,
            "iPad2,4"    : .iPad2,
            "iPad2,5"    : .iPadMini1,
            "iPad2,6"    : .iPadMini1,
            "iPad2,7"    : .iPadMini1,
            "iPhone3,1"  : .iPhone4,
            "iPhone3,2"  : .iPhone4,
            "iPhone3,3"  : .iPhone4,
            "iPhone4,1"  : .iPhone4S,
            "iPhone5,1"  : .iPhone5,
            "iPhone5,2"  : .iPhone5,
            "iPhone5,3"  : .iPhone5C,
            "iPhone5,4"  : .iPhone5C,
            "iPad3,1"    : .iPad3,
            "iPad3,2"    : .iPad3,
            "iPad3,3"    : .iPad3,
            "iPad3,4"    : .iPad4,
            "iPad3,5"    : .iPad4,
            "iPad3,6"    : .iPad4,
            "iPhone6,1"  : .iPhone5S,
            "iPhone6,2"  : .iPhone5S,
            "iPad4,1"    : .iPadAir1,
            "iPad4,2"    : .iPadAir2,
            "iPad4,4"    : .iPadMini2,
            "iPad4,5"    : .iPadMini2,
            "iPad4,6"    : .iPadMini2,
            "iPad4,7"    : .iPadMini3,
            "iPad4,8"    : .iPadMini3,
            "iPad4,9"    : .iPadMini3,
            "iPad6,3"    : .iPadPro9_7,
            "iPad6,11"   : .iPadPro9_7,
            "iPad6,4"    : .iPadPro9_7_cell,
            "iPad6,12"   : .iPadPro9_7_cell,
            "iPad6,7"    : .iPadPro12_9,
            "iPad6,8"    : .iPadPro12_9_cell,
            "iPad7,3"    : .iPadPro10_5,
            "iPad7,4"    : .iPadPro10_5_cell,
            "iPhone7,1"  : .iPhone6plus,
            "iPhone7,2"  : .iPhone6,
            "iPhone8,1"  : .iPhone6S,
            "iPhone8,2"  : .iPhone6Splus,
            "iPhone8,4"  : .iPhoneSE,
            "iPhone9,1"  : .iPhone7,
            "iPhone9,2"  : .iPhone7plus,
            "iPhone9,3"  : .iPhone7,
            "iPhone9,4"  : .iPhone7plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,6" : .iPhoneX
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!]
        {
            return model
        }
        return Model.unrecognized
    }
}
