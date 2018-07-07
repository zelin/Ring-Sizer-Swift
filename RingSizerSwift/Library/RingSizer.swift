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

class RingSizer : UIView
{
    let textLabel : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 20));
    
    @IBInspectable var arrowStrokeWidth : CGFloat = 1.0;
    @IBInspectable var linesStrokeWidth : CGFloat = 1.0;
    @IBInspectable var ringStrokeWidth  : CGFloat = 2.0;
    
    @IBInspectable var gridAxisStroke : CGFloat = 1.0;
    @IBInspectable var gridStroke     : CGFloat = 0.3;
    
    // Diameter should be in mm
    @IBInspectable var diameter : CGFloat = 9.91;
    
    @IBInspectable var arrowColor  : UIColor = UIColor.blue;
    @IBInspectable var linesColor  : UIColor = UIColor.gray;
    @IBInspectable var textColor   : UIColor = UIColor.red;
    @IBInspectable var textBgColor : UIColor = UIColor.gray;

    @IBInspectable var textFont : UIFont = UIFont.systemFont(ofSize: 12);
    @IBInspectable var textPaddingWidth  : CGFloat = 10;
    @IBInspectable var textPaddingHeight : CGFloat = 5;

    private var labelText : String = "0000"
    private var MM_CONSTANT : CGFloat = 0.0779

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.addSubview(self.textLabel)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func  updateValues() -> Void
    {
        self.textLabel.textColor = textColor;
        self.textLabel.font = textFont;
        self.textLabel.textAlignment = NSTextAlignment.center
        self.textLabel.backgroundColor = textBgColor;
        self.textLabel.text = labelText;
        self.textLabel.layer.cornerRadius = 5.0;
        self.textLabel.clipsToBounds = true
    }
    
    override func draw(_ rect: CGRect)
    {
        MM_CONSTANT = UIDevice().pointConversion
        let radius : CGFloat = self.diameter/2.0;
        let distance : CGFloat = (radius / MM_CONSTANT);
        
        let midX : CGFloat = rect.size.width  / 2;
        let midY : CGFloat = rect.size.height / 2;
        
        if let context = UIGraphicsGetCurrentContext()
        {
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
            
            let borderRect : CGRect = CGRect.init(x: midX - distance,
                                                  y: midY - distance,
                                                  width: 2 * distance,
                                                  height: 2 * distance)
            
            
            context.setStrokeColor(linesColor.cgColor)
            context.setLineWidth(ringStrokeWidth)
            context.strokeEllipse(in: borderRect)
            
            context.strokePath()
            
            self.updateValues()
            
            self.textLabel.sizeToFit();
            self.textLabel.frame = CGRect.init(x: 0, y: 0, width: self.textLabel.frame.size.width + textPaddingWidth, height: self.textLabel.frame.size.height + textPaddingHeight)
            self.textLabel.center = CGPoint.init(x: midX, y: midY);
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
    
    func setSize(diameter: CGFloat, text: String) -> Void
    {
        self.labelText = text;
        self.diameter = diameter;
        self.setNeedsDisplay()
    }
}
