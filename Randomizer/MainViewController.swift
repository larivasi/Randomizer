//
//  ViewController.swift
//  Randomizer
//
//  Created by Ларин Василий on 02.10.2022.
//

import UIKit

protocol SettingsVIewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var randomValueLabel: UILabel!
    @IBOutlet weak var getRandomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomValueLabel.text = "?"
        getRandomNumberButton.layer.cornerRadius = 12
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
        
    }

    @IBAction func getRandomNumberButtonTapped() {
        randomValueLabel.text = randomNumber.getRandom.formatted()
    }

}

// MARK: - SettingsVIewControllerDelegate
extension MainViewController: SettingsVIewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        self.randomNumber = randomNumber
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
    }
}
