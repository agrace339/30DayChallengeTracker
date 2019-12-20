//
//  CheckInViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/15/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit
import Charts

class CheckInViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var CheckInTextField: UITextField!
    @IBOutlet var PopUpView: UIView!
    @IBOutlet var AddButton: UIButton!
    @IBOutlet var CancelButton: UIButton!
    
    var dayIndex = 0
    var doneSaving: (() -> ())?
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func AddButtonClicked(_ sender: Any) {
        Data.currentDays[dayIndex].complete = true
        
        let x = Double(dayIndex)
        let data = ChartDataEntry()
        data.x = x
        data.y = NumberFormatter().number(from: CheckInTextField.text!)!.doubleValue
        //TODO - Last data value may not be for this day. Have to check entire array for duplicate x values
        if Data.currentChallenge.data.last?.x == x{
            _ = Data.currentChallenge.data.popLast()
        }
        Data.currentChallenge.data.append(data)
        
        
        dismiss(animated: true)
        if let doneSaving = doneSaving{
            doneSaving()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUpView.layer.cornerRadius = 10
        CancelButton.layer.cornerRadius = 10
        AddButton.layer.cornerRadius = 10
        
        CheckInTextField.keyboardType = .decimalPad
        CheckInTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.CheckInTextField.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.CheckInTextField.endEditing(true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        let boolIsNumber = allowedCharacters.isSuperset(of: characterSet)
        if boolIsNumber == true {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                } else {
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            } else {
                return false
            }
        }
    }

}
