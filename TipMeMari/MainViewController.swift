//
//  ViewController.swift
//  TipMeMari
//
//  Created by Mari Batilando on 12/22/14.
//  Copyright (c) 2014 MariBatilando. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate, newSettingsDelegate {

    @IBOutlet weak var balanceContainer: UIView!
    @IBOutlet weak var tipContainer: UIView!
    @IBOutlet weak var totalContainer: UIView!
    @IBOutlet weak var balanceAmount: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        balanceAmount.delegate = self
        balanceContainer.backgroundColor = UIColorFromHex(0x53F1E5)
        tipContainer.backgroundColor = UIColorFromHex(0xFFC558)
        totalContainer.backgroundColor = UIColorFromHex(0xFFA158)
        var defaultTip = defaults.floatForKey("defaultTip")
        if (defaultTip != 0) {
            tipAmount.text = "\(Int(defaultTip))"
            slider.value = defaultTip
        }
        else {
            tipAmount.text = "20"
            slider.value = Float(20)
            defaults.setFloat(Float(20), forKey: "defaultTip")
            defaults.synchronize()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var secondViewController = (segue.destinationViewController as  SettingsViewController)
        secondViewController.delegate = self
    }
    
    func setNewSettings(value: Float) {
        if (value != slider.value) {
            slider.value = value
        }

        var currentTipValue = Double(Int(value)), // Cast to int to round
            balance = (balanceAmount.text as NSString).doubleValue;

        updateValues(currentTipValue, balance: balance)
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChanged(sender: UISlider) {
        updateValues()
    }
    
    func calculateTotal (amount:Double, tip:Double) -> Double {
        return amount + (amount * Double(tip/100))
    }
    
    func updateValues () -> () {
        var currentTipValue = Double(Int(slider.value)), // Cast to int to round
            balance = (balanceAmount.text as NSString).doubleValue,
            newTotal = calculateTotal(balance, tip: currentTipValue)
        
        tipAmount.text = "\(Int(slider.value))"
        totalAmount.text = "\(newTotal)"
    }
    
    func updateValues(tipValue: Double, balance: Double) -> () {
        var newTotal = calculateTotal(balance, tip: tipValue)
        
        tipAmount.text = "\(Int(slider.value))"
        totalAmount.text = "\(newTotal)"
    }

}



