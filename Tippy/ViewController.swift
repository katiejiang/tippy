//
//  ViewController.swift
//  Tippy
//
//  Created by Katie Jiang on 6/20/17.
//  Copyright © 2017 Katie Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let option1 = defaults.integer(forKey: "default_tip_option_1")
        let option2 = defaults.integer(forKey: "default_tip_option_2")
        let option3 = defaults.integer(forKey: "default_tip_option_3")

        tipControl.setTitle("\(option1)%", forSegmentAt: 0)
        tipControl.setTitle("\(option2)%", forSegmentAt: 1)
        tipControl.setTitle("\(option3)%", forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let option1 = defaults.integer(forKey: "default_tip_option_1")
        let option2 = defaults.integer(forKey: "default_tip_option_2")
        let option3 = defaults.integer(forKey: "default_tip_option_3")
        let tipPercentages = [option1, option2, option3]
        
        let bill = Double(billField.text!) ?? 0
        let tip = 0.01 * bill * Double(tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

