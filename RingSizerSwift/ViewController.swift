//
//  ViewController.swift
//  RingSizerSwift
//
//  Created by Muhammad Umar on 06/07/2018.
//  Copyright © 2018 Neberox Technologies. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var ringSizer : RingSizer!;
    @IBOutlet var slider : UISlider!;
    
    @IBOutlet var myTable : UITableView!;
    
    var ringSizes : NSMutableArray = NSMutableArray.init()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
                            let ringSizeModel : RingSizeModel = RingSizeModel.init(diameter: CGFloat((jsonObject["diameter"]! as NSString).floatValue), usaCode: jsonObject["usa"]!)
                            
                            self.ringSizes.add(ringSizeModel)
                        }
                    }
                }
            }
        }

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





