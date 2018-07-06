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
//  RingSizeModel.swift
//  RingSizerSwift
//
//  Created by Muhammad Umar on 07/07/2018.
//  Copyright © 2018 Neberox Technologies. All rights reserved.
//

import Foundation
import UIKit

class RingSizeModel: NSObject
{
    public var diameter  : CGFloat = 1.0;
    public var usaCode   : String?;
    public var ausCode   : String?;
    public var euroCode  : String?;
    public var japCode   : String?;
    
    init(diameter: CGFloat, usaCode: String)
    {
        self.diameter = diameter
        self.usaCode = usaCode
    }
    
    init(diameter: CGFloat, usaCode: String, ausCode: String, euroCode: String, japCode: String)
    {
        self.diameter = diameter
        self.usaCode  = usaCode
        self.ausCode  = ausCode
        self.euroCode = euroCode
        self.japCode  = japCode
    }
}
