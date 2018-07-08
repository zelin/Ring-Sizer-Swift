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
//  ViewController.swift
//  RingSizerSwift
//
//  Created by Muhammad Umar on 06/07/2018.
//  Copyright © 2018 Neberox Technologies. All rights reserved.
//

import UIKit
import Foundation

class RingSizerController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var ringSizer : RingSizer!;
    @IBOutlet var slider : UISlider!;
    
    @IBOutlet var myTable : UITableView!;
    
    var ringSizes : NSMutableArray = NSMutableArray.init()
    
    @IBOutlet var inches : UITextField!
    @IBOutlet var width  : UITextField!
    @IBOutlet var height : UITextField!

    @IBOutlet var result : UILabel!

    @IBAction func calculate()
    {
        let inch : CGFloat = NumberFormatter().number(from: self.inches.text!) as! CGFloat
        let d : CGFloat = inch * 25.4;  // 1 mm into millimeter
        let m : CGFloat  = NumberFormatter().number(from: width.text!) as! CGFloat;
        let n : CGFloat  = NumberFormatter().number(from: height.text!) as! CGFloat;
        let x : CGFloat  = (d * m)/(sqrt( (m * m) + (n * n)))
        let y : CGFloat  = ( x * n ) / m
        print(x)
        print(y)
        result.text = String.init(format: "%.6f", x)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.ringSizes = self.ringSizer.getRingSizes()
        if self.ringSizes.count > 1
        {
            self.slider.maximumValue = Float.init(self.ringSizes.count - 1)
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.ringSizes.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellReuseIdentifier = "ringIdentifier";
        let cell : UITableViewCell = self.myTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let ringSize : RingSizeModel = self.ringSizes.object(at: indexPath.row) as! RingSizeModel
        // set the text from the data model
        cell.textLabel?.text = ringSize.usaCode! as String
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let ringSize : RingSizeModel = self.ringSizes.object(at: indexPath.row) as! RingSizeModel
        self.ringSizer.setSize(diameter: ringSize.diameter, text: ringSize.usaCode!)
    }
    
    @IBAction func sliderValueChanged(slider: UISlider) -> Void
    {
        let indexPath = IndexPath.init(row: Int.init(self.slider.value), section: 0)
        let ringSize : RingSizeModel = self.ringSizes.object(at: indexPath.row) as! RingSizeModel
        self.ringSizer.setSize(diameter: ringSize.diameter, text: ringSize.usaCode!)
        self.myTable.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
        self.myTable.scrollToRow(at: indexPath, at: UITableViewScrollPosition.none, animated: true)
    }
}





