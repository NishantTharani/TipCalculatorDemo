//
//  ViewController.swift
//  Prework
//
//  Created by Nish on 04/02/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the navbar
        self.title = "Tip Calculator"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Make the bill amount the first responder
        billAmountTextField.becomeFirstResponder()
        
        // Rewrite the tip values each time the view appears
        // Set the tip amounts if this is the first time the app has been run
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "leftTip") == nil) {
            defaults.set(15, forKey: "leftTip")
            defaults.set(18, forKey: "middleTip")
            defaults.set(20, forKey: "rightTip")
        }
        
        // Retrieve the tip amounts and set the text fields with them
        let leftTip = String(defaults.integer(forKey: "leftTip")) + "%"
        let middleTip = String(defaults.integer(forKey: "middleTip")) + "%"
        let rightTip = String(defaults.integer(forKey: "rightTip")) + "%"
        
        tipControl.setTitle(leftTip, forSegmentAt: 0)
        tipControl.setTitle(middleTip, forSegmentAt: 1)
        tipControl.setTitle(rightTip, forSegmentAt: 2)
        
        // Re-calculate the tip if the percentages were changed
        calculateTip(tipControl!)
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get the tip percentage
        let tipPercentageStr = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)!.dropLast()
        let tipPercentage = Double(tipPercentageStr)! / 100
        
        // Calculate total tip
        let tip = bill * tipPercentage
        let total = bill + tip
        
        // Update tip and total amount labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func billAmountEdited(_ sender: Any) {
        calculateTip(tipControl!)
    }
}

