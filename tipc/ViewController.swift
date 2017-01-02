//
//  ViewController.swift
//  tipc
//
//  Created by fer on 12/5/16.
//  Copyright © 2016 fer. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

var bRedVal = defaults.float(forKey: "backRed")
var bGreenVal = defaults.float(forKey: "backGreen")
var bBlueVal = defaults.float(forKey: "backBlue")

var tRedVal = defaults.float(forKey: "tintRed")
var tGreenVal = defaults.float(forKey: "tintGreen")
var tBlueVal = defaults.float(forKey: "tintBlue")
var percentSaved = defaults.double(forKey: "defPercent")

class ViewController: UIViewController {
    
    @IBOutlet weak var bInput: UITextField!
    @IBOutlet weak var tipOutB: UITextView!
    @IBOutlet weak var totalOutB: UITextView!
    @IBOutlet weak var tipPerc: UISegmentedControl!
    
    @IBOutlet weak var bill: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var total: UILabel!
    
    var tippercent : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bRedVal = 0.0
        bGreenVal = 0.0
        bBlueVal = 0.0
        
        tRedVal = 0.0
        tGreenVal = 255.0
        tBlueVal = 0.0
        
        percentSaved = -1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        super.view.backgroundColor = UIColor(red: CGFloat(bRedVal), green: CGFloat(bGreenVal), blue: CGFloat(bBlueVal), alpha: 1)
        bill.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tip.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        total.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tipOutB.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        totalOutB.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tipPerc.tintColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        
        tippercent = Double(defaults.float(forKey: "defPercent"))
    }

    @IBAction func calcTip(_: AnyObject) {
        let tipP = [0.1, 0.15, 0.2]
        let totalB = Double(bInput.text!) ?? 0
        
        if percentSaved == -1.0
        {
            percentSaved = tipP[tipPerc.selectedSegmentIndex]
        }
        else{
            percentSaved = tippercent
        }
        
        let tip = totalB * percentSaved
        let total = totalB + tip
        
        tipOutB.text = String(format: "%.2f", tip)
        totalOutB.text = String(format: "%.2f", total)
    }
}
