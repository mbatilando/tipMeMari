//
//  ViewController.swift
//  TipMeMari
//
//  Created by Mari Batilando on 12/22/14.
//  Copyright (c) 2014 MariBatilando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balanceAmount: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var slider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        balanceAmount.text = String(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChanged(sender: UISlider) {
        var currentTipValue = Double(Int(sender.value)),
            balance = (balanceAmount.text as NSString).doubleValue,
            newTotal = calculateTotal(balance, tip: currentTipValue)

        tipAmount.text = "\(Int(sender.value))"
        totalAmount.text = "\(newTotal)"
    }
    
    func calculateTotal (amount:Double, tip:Double) -> Double {
        return amount + (amount * Double(tip/100))
    }
}



