//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Katie Jiang on 6/20/17.
//  Copyright © 2017 Katie Jiang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var option1field: UITextField!
    @IBOutlet weak var option2field: UITextField!
    @IBOutlet weak var option3field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        option1field.text = String(defaults.integer(forKey: "default_tip_option_1"))
        option2field.text = String(defaults.integer(forKey: "default_tip_option_2"))
        option3field.text = String(defaults.integer(forKey: "default_tip_option_3"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeOption1(_ sender: Any) {
        let defaults = UserDefaults.standard
        let option1 = Double(option1field.text!) ?? 15
        defaults.set(option1, forKey: "default_tip_option_1")
        defaults.synchronize()
    }

    @IBAction func changeOption2(_ sender: Any) {
        let defaults = UserDefaults.standard
        let option2 = Double(option2field.text!) ?? 20
        defaults.set(option2, forKey: "default_tip_option_2")
        defaults.synchronize()
    }
    
    @IBAction func changeOption3(_ sender: Any) {
        let defaults = UserDefaults.standard
        let option3 = Double(option3field.text!) ?? 25
        defaults.set(option3, forKey: "default_tip_option_3")
        defaults.synchronize()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
