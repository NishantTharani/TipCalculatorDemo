//
//  SettingsViewController.swift
//  Prework
//
//  Created by Nish on 04/02/2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var leftTipAmount: UITextField!
    @IBOutlet weak var middleTipAmount: UITextField!
    @IBOutlet weak var rightTipAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load the tip amounts and fill in the boxes with them
        let defaults = UserDefaults.standard
        let leftTip = String(defaults.integer(forKey: "leftTip"))
        let middleTip = String(defaults.integer(forKey: "middleTip"))
        let rightTip = String(defaults.integer(forKey: "rightTip"))
        
        leftTipAmount.text = leftTip
        middleTipAmount.text = middleTip
        rightTipAmount.text = rightTip
    }
    

    @IBAction func anyTipEdited(_ sender: Any) {
        // Update all the stored values. Yeah, it's inefficient
        let leftTip = Int(leftTipAmount.text!)
        let midTip = Int(middleTipAmount.text!)
        let rightTip = Int(rightTipAmount.text!)
        let defaults = UserDefaults.standard
        defaults.set(leftTip, forKey: "leftTip")
        defaults.set(midTip, forKey: "middleTip")
        defaults.set(rightTip, forKey: "rightTip")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
