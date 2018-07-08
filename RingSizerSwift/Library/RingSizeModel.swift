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
