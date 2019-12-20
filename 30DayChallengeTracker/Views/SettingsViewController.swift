//
//  SettingsViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/18/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var popUpView: UIView!
    @IBOutlet var TitleTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var archiveBtn: UIButton!
    @IBOutlet var deletebtn: UIButton!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var saveBtn: UIButton!
    
    var doneSaving: (() -> ())?
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        Data.currentChallenge.title = TitleTextField.text
        print(Data.currentChallenge.title!)
        print(Data.currentChallenge.challengeType!)
        Data.currentChallenge.startDate = datePicker.date
        print(Data.currentChallenge.startDate!)
        _ = Data.updateCurrentDay()
        self.dismiss(animated: true)
        if let doneSaving = doneSaving{
            doneSaving()
        }
    }
    @IBAction func cancelBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10
        deletebtn.layer.cornerRadius = 5
        saveBtn.layer.cornerRadius = 10
        TitleTextField.text = Data.currentChallenge.title
        
        TitleTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.TitleTextField.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.TitleTextField.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsToHome"{
            let popup = segue.destination as! InfoViewController
            popup.message = "Type determines what kind of data you want to track. Binary means that the data falls into to catagories. Either it happened or it didn't. Numeric means that the data is a number, like 15 minutes of meditations."
        }
    }
}
