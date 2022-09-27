//
//  ViewController.swift
//  tipcalc
//
//  Created by Georgina Woo on 08/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBAction func groupStep(_ sender: UIStepper)
    {
        groupLabel.text = Int(sender.value).description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        //get total tip (bill * tip %)
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //get group size
        let groupSize = Int(groupLabel.text!) ?? 0
        //update tip amount
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
        //calculate split  bill
        let split = (bill + tip) / Double(groupSize)
        splitLabel.text = String(format: "$%.2f", split)
    }

}

