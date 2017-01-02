//
//  SettingsViewController.swift
//  tipc
//
//  Created by fer on 12/29/16.
//  Copyright © 2016 fer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var bRedLabel: UILabel!
    @IBOutlet weak var bGreenLabel: UILabel!
    @IBOutlet weak var bBlueLabel: UILabel!
    
    @IBOutlet weak var tRedLabel: UILabel!
    @IBOutlet weak var tGreenLabel: UILabel!
    @IBOutlet weak var tBlueLabel: UILabel!
    
    @IBOutlet weak var bRed: UISlider!
    @IBOutlet weak var bGreen: UISlider!
    @IBOutlet weak var bBlue: UISlider!
    
    @IBOutlet weak var tRed: UISlider!
    @IBOutlet weak var tGreen: UISlider!
    @IBOutlet weak var tBlue: UISlider!
    
    @IBOutlet weak var defaultTip: UILabel!
    @IBOutlet weak var theme: UILabel!
    @IBOutlet weak var background: UILabel!
    @IBOutlet weak var red1: UILabel!
    @IBOutlet weak var green1: UILabel!
    @IBOutlet weak var blue1: UILabel!
    
    @IBOutlet weak var tintt: UILabel!
    @IBOutlet weak var red2: UILabel!
    @IBOutlet weak var green2: UILabel!
    @IBOutlet weak var blue2: UILabel!
    
    @IBOutlet weak var setTip: UISegmentedControl!
    @IBOutlet weak var currentP: UILabel!
    @IBOutlet weak var currentPNum: UILabel!
    
    var bRPrev : Float = 0.0
    var bGPrev : Float = 0.0
    var bBPrev : Float = 0.0
    
    var tRPrev : Float = 0.0
    var tGPrev : Float = 0.0
    var tBPrev : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        super.view.backgroundColor = UIColor(red: CGFloat(bRedVal), green: CGFloat(bGreenVal), blue: CGFloat(bBlueVal), alpha: 0.5)
        setTip.tintColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 0.5)
        defaultTip.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        theme.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        background.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        red1.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        green1.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        blue1.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tintt.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        red2.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        green2.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        blue2.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        bRedLabel.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        bGreenLabel.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        bBlueLabel.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tRedLabel.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tGreenLabel.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        tBlueLabel.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        currentP.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        currentPNum.textColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        self.view?.tintColor = UIColor(red: CGFloat(tRedVal), green: CGFloat(tGreenVal), blue: CGFloat(tBlueVal), alpha: 1)
        currentPNum.text = defaults.string(forKey: "status") ?? "--"
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bRedChange(_ sender: UISlider) {
        bRPrev = sender.value
        bRedLabel.text = String(bRPrev)
        bcalc()
    }
    
    @IBAction func bGreenChange(_ sender: UISlider){
        bGPrev = sender.value
        bGreenLabel.text = String(bGPrev)
        bcalc()
    }
    
    @IBAction func bBlueChange(_ sender: UISlider) {
        bBPrev = sender.value
        bBlueLabel.text = String(bBPrev)
        bcalc()
    }
    
    @IBAction func tRedChange(_ sender: UISlider) {
        tRPrev = sender.value
        tRedLabel.text = String(tRPrev)
        tcalc()
    }
    
    @IBAction func tGreenChange(_ sender: UISlider) {
        tGPrev = sender.value
        tGreenLabel.text = String(tGPrev)
        tcalc()
    }
    
    @IBAction func tBlueChange(_ sender: UISlider) {
        tBPrev = sender.value
        tBlueLabel.text = String(tBPrev)
        tcalc()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        themeSave()
        percentSave()
        defaults.synchronize()
    }
    
    func themeSave()
    {
        bRedVal = bRPrev
        bGreenVal = bGPrev
        bBlueVal = bBPrev
        
        tRedVal = tRPrev
        tGreenVal = tGPrev
        tBlueVal = tBPrev
        
        defaults.set(bRedVal, forKey: "backRed")
        defaults.set(bGreenVal, forKey: "backGreen")
        defaults.set(bBlueVal, forKey: "backBlue")
        
        defaults.set(tRedVal, forKey: "tintRed")
        defaults.set(tGreenVal, forKey: "tintGreen")
        defaults.set(tBlueVal, forKey: "tintBlue")
    }
    
    func percentSave()
    {
        let x = [0.1, 0.15, 0.2]
        let percent = x[setTip.selectedSegmentIndex]
        
        if percent == 0.1
        {
            currentPNum.text = "10%"
        }
        else if percent == 0.15
        {
            currentPNum.text = "15%"
        }
        else if percent == 0.2
        {
            currentPNum.text = "20%"
        }
        
        defaults.set(percent, forKey: "defPercent")
        defaults.set(currentPNum.text, forKey: "status")
    }
    
    func bcalc()
    {
        super.view.backgroundColor = UIColor(red: CGFloat(bRPrev), green: CGFloat(bGPrev), blue: CGFloat(bBPrev), alpha: 1)
    }
    
    func tcalc()
    {
        setTip.tintColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 0.5)
        defaultTip.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        theme.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        background.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        red1.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        green1.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        blue1.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        tintt.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        red2.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        green2.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        blue2.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        bRedLabel.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        bGreenLabel.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        bBlueLabel.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        tRedLabel.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        tGreenLabel.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        tBlueLabel.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        currentP.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        currentPNum.textColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
        self.view?.tintColor = UIColor(red: CGFloat(tRPrev), green: CGFloat(tGPrev), blue: CGFloat(tBPrev), alpha: 1)
    }
}

