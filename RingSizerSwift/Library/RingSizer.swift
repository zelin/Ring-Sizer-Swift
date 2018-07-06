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
//  RingSizer.swift
//  RingSizer
//
//  Created by Muhammad Umar on 06/07/2018.
//  Copyright © 2018 Neberox Technologies. All rights reserved.
//
import Foundation
import UIKit
import QuartzCore

@IBDesignable
class RingSizer : UIView
{
    // Display ring size in the middle of the circle.
    private let textLabel : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 20))
    // Stroke width of the arrows
    @IBInspectable var arrowStrokeWidth : CGFloat = 1.0
    // Stroke width of the lines of the grid
    @IBInspectable var linesStrokeWidth : CGFloat = 1.0
    // Stroke width of the circle upon which ring will be placed
    @IBInspectable var ringStrokeWidth  : CGFloat = 2.0
    
    // Diameter of the ring. Should be in mm
    @IBInspectable var diameter : CGFloat = 9.91
    // Color of the arrows drawn. To remove color set UIColor.clear
    @IBInspectable var arrowColor  : UIColor = UIColor.gray
    // Color of the grid lines drawn. To remove color set UIColor.clear
    @IBInspectable var linesColor  : UIColor = UIColor.gray
    // Color of the text of textLabel.
    @IBInspectable var textColor   : UIColor = UIColor.black
    // Color of the background of textLabel.
    @IBInspectable var textBgColor : UIColor = UIColor.gray

    // Font of the textLabel. Default is 12 and system Font
    @IBInspectable var textFont : UIFont = UIFont.systemFont(ofSize: 12)
    // left and right text Padding to add in textLabel
    @IBInspectable var textPaddingWidth  : CGFloat = 10
    // top and bottom text Padding to add in textLabel
    @IBInspectable var textPaddingHeight : CGFloat = 5

    private var labelText : String = "0000"
    private var mmConstant : CGFloat = 0.0779

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.addSubview(self.textLabel)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    private func  updateValues() -> Void
    {
        self.textLabel.textColor = textColor
        self.textLabel.font = textFont
        self.textLabel.textAlignment = NSTextAlignment.center
        self.textLabel.backgroundColor = textBgColor
        self.textLabel.text = labelText
        self.textLabel.layer.cornerRadius = 5.0
        self.textLabel.clipsToBounds = true
    }
    
    override func draw(_ rect: CGRect)
    {
        mmConstant = UIDevice().pointConversion
        let radius : CGFloat = self.diameter/2.0
        let distance : CGFloat = (radius / mmConstant)
        
        let midX : CGFloat = rect.size.width  / 2
        let midY : CGFloat = rect.size.height / 2
        
        if let context = UIGraphicsGetCurrentContext()
        {
            // Creating grid lines
            context.setStrokeColor(linesColor.cgColor)
            context.setLineWidth(linesStrokeWidth)

            // line 1
            context.move(to: CGPoint.init(x: 0, y: (midY - distance)))
            context.addLine(to: CGPoint.init(x: rect.size.width, y: midY - distance))
            // line 2
            context.move(to: CGPoint.init(x: 0, y: (midY + distance)))
            context.addLine(to: CGPoint.init(x: rect.size.width, y: (midY + distance)))
            // line 3
            context.move(to: CGPoint.init(x: (midX - distance), y: 0))
            context.addLine(to: CGPoint.init(x: (midX - distance), y: rect.size.height))
            // line 4
            context.move(to: CGPoint.init(x: (midX + distance), y:0.0))
            context.addLine(to: CGPoint.init(x: (midX + distance), y:rect.size.height))
            
            context.strokePath()
            // Creating ring
            let borderRect : CGRect = CGRect.init(x: midX - distance,
                                                  y: midY - distance,
                                                  width: 2 * distance,
                                                  height: 2 * distance)
            
            
            context.setStrokeColor(linesColor.cgColor)
            context.setLineWidth(ringStrokeWidth)
            context.strokeEllipse(in: borderRect)
            
            context.strokePath()
            
            self.updateValues()
            
            self.textLabel.sizeToFit()
            self.textLabel.frame = CGRect.init(x: 0, y: 0, width: self.textLabel.frame.size.width + textPaddingWidth, height: self.textLabel.frame.size.height + textPaddingHeight)
            self.textLabel.center = CGPoint.init(x: midX, y: midY)
            self.textLabel.removeFromSuperview()
            self.addSubview(self.textLabel)
            
            // We have to draw arrows now
            context.setStrokeColor(linesColor.cgColor)
            context.setLineWidth(linesStrokeWidth)
            context.move(to: CGPoint.init(x: midX - distance + 5, y: midY))
            context.addLine(to: CGPoint.init(x: self.textLabel.frame.origin.x - 5, y: midY))
            
            context.move(to: CGPoint.init(x: midX + distance - 5, y: midY))
            context.addLine(to: CGPoint.init(x: self.textLabel.frame.origin.x + self.textLabel.frame.size.width + 5, y: midY))

            context.strokePath()

            // Arrow to Left
            context.setStrokeColor(arrowColor.cgColor)
            context.setLineWidth(arrowStrokeWidth)
            
            context.move(to: CGPoint.init(x: midX - distance + 5, y: midY))
            context.addLine(to: CGPoint.init(x: midX - distance + 10, y: midY - 7))
            context.move(to: CGPoint.init(x: midX - distance + 5, y: midY))
            context.addLine(to: CGPoint.init(x: midX - distance + 10, y: midY + 7))

            // Arrow to Right
            context.move(to: CGPoint.init(x: midX + distance - 5, y: midY))
            context.addLine(to: CGPoint.init(x: midX + distance - 10, y: midY - 7))
            context.move(to: CGPoint.init(x: midX + distance - 5, y: midY))
            context.addLine(to: CGPoint.init(x: midX + distance - 10, y: midY + 7))

            
            context.strokePath()
        }
    }
    
    /**
     *  Function is used to set size of the ring. Diameter should be in mm -- Text can be anything , diameter or ring size
     *
     */
    func setSize(diameter: CGFloat, text: String) -> Void
    {
        self.labelText = text
        self.diameter = diameter
        self.setNeedsDisplay()
    }
    /* Get all ring sizes currently USA, Japan, Europe and Austrailia formats added */
    func getRingSizes() -> NSMutableArray
    {
        let ringSizes = NSMutableArray.init()
        if let filePath = Bundle.main.path(forResource: "sizes", ofType: "json")
        {
            if let data = NSData.init(contentsOfFile: filePath)
            {
                if let json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String:AnyObject]
                {
                    if let jsonArray = json!["data"]!["sizes"] as? [[String: String]]
                    {
                        for jsonObject in jsonArray
                        {
                            let ringSizeModel : RingSizeModel = RingSizeModel.init(
                                diameter: CGFloat((jsonObject["diameter"]! as NSString).floatValue),
                                usaCode: jsonObject["usa"]!,
                                ausCode: jsonObject["australia"]!, euroCode: jsonObject["europe"]!, japCode: jsonObject["japan"]!
                            )
                            
                            ringSizes.add(ringSizeModel)
                        }
                    }
                }
            }
        }
        
        return ringSizes
    }
}
