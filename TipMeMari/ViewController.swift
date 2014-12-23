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
        var currentTipValue = Int(sender.value),
            total = balanceAmount.text?.floatValue ?? 0.0,
            newTotal = calculateTotal(total, tip: currentTipValue)

        tipAmount.text = "\(currentTipValue)"
        totalAmount.text = "\(newTotal)"
    }
    
    func calculateTotal (amount:Int, tip:Int) -> Float {
        return (amount * Float(tip/100))
    }
}



