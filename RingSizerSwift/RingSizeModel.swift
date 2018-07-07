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
    public var diameter : CGFloat = 1.0;
    public var usaCode  : String?;
    
    init(diameter: CGFloat, usaCode: String)
    {
        self.diameter = diameter
        self.usaCode = usaCode
    }
}
