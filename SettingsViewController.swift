//
//  SettingsViewController.swift
//  TipMeMari
//
//  Created by Mari Batilando on 12/27/14.
//  Copyright (c) 2014 MariBatilando. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipAmountLabel: UILabel!
    @IBOutlet weak var defaultTipAmountSlider: UISlider!
    @IBOutlet weak var defaultTipContainer: UIView!
    
    
    var delegate: newSettingsDelegate?,
        defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipContainer.backgroundColor = UIColorFromHex(0x6393F3)
        var defaultTip = defaults.floatForKey("defaultTip")
        if (defaultTip != 0) {
            defaultTipAmountLabel.text = "\(Int(defaultTip))"
            defaultTipAmountSlider.value = defaultTip
        }
        else {
            defaultTipAmountLabel.text = "20"
            defaultTipAmountSlider.value = Float(20)
            defaults.setFloat(Float(20), forKey: "defaultTip")
            defaults.synchronize()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        updateSettings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        defaultTipAmountLabel.text = "\(Int(sender.value))"
    }
    
    func updateSettings() {
        delegate?.setNewSettings(defaultTipAmountSlider.value)
        defaults.setFloat(defaultTipAmountSlider.value, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    
}