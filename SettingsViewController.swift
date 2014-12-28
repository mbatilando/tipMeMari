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
    var delegate: newSettingsDelegate?,
        defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        defaultTipAmountLabel.text = "\(Int(sender.value))"
        delegate?.setNewSettings(sender.value)
        defaults.setFloat(sender.value, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    
}