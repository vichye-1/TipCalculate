//
//  ViewController.swift
//  Calculate
//
//  Created by 양승혜 on 2023/09/15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var personControl: UIStepper!
    
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var personPrice: UILabel!
    
    @IBOutlet weak var darkSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func darkSwitchMode(_ sender: Any) {
        if darkSwitch.isOn == true {
            view.overrideUserInterfaceStyle = .light
        } else {
            view.overrideUserInterfaceStyle = .dark
        }
    }
    
    @IBAction func splitPeople(_ sender: UIStepper) {
        personLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        // tip calculation
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let perperson = total / personControl.value
                
        // tip update
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // total update
        totalLabel.text = String(format: "$%.2f", total)
        
        //perperson price
        personPrice.text = String(format: "$%.2f", perperson)
    }
    
}

