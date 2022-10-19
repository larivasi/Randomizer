//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Vasyl Larin on 17.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var minimumLabelTF: UITextField!
    @IBOutlet weak var maximumLabelTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsVIewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        maximumLabelTF.delegate = self
        minimumLabelTF.delegate = self
        minimumLabelTF.text = randomNumber.minimumValue.formatted()
        maximumLabelTF.text = randomNumber.maximumValue.formatted()
    }
    
    
    
    @IBAction func saveButton() {
        view.endEditing(true)
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton() {
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        if textField == minimumLabelTF {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}
