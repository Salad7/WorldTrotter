//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Mohamed Salad on 11/16/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func didChangeLabel(_ sender: UITextField) {
        if let text = sender.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }
        else {
            fahrenheitValue = nil
        }
    }
    func updateCelciusLabel(){
        if let celciusValue = celciusValue {
            celciusLabel.text =
                        numberFormatter.string(from: NSNumber(value: celciusValue.value))
        }
        else {
            celciusLabel.text = "???"
        }
    }
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
            let replacementTextHasDecimalSeparator = string.range(of: ".")

            if existingTextHasDecimalSeparator != nil,
                replacementTextHasDecimalSeparator != nil {
                return false
            } else {
                return true
            }
    }
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }
        else{
            return nil
        }
    }
    @IBOutlet weak var celciusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelciusLabel()
        // Do any additional setup after loading the view.
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()


}

