//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Brynner Ventura on 8/12/23.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var farenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsuisLabel()
        }
    }
    var celsuisValue: Measurement<UnitTemperature>? {
        if let farenheitValue = farenheitValue {
            return farenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
        
        updateCelsuisLabel()
    }
    
    @IBAction func farenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            farenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsuisLabel() {
        if let celsuisValue = celsuisValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsuisValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isEmpty {
            return true
        }
        
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
        
        // Check if the replacement string only contains characters from the allowed set
        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
        if !allowedCharacterSet.isSuperset(of: replacementStringCharacterSet) {
            return false
        }
        
        // Check for multiple decimal separators in the textField
        if string == "." && textField.text?.contains(".") == true {
            return false
        }
        
        return true
        
    }
}

