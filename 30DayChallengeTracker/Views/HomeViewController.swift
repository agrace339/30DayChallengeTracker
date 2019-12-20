//
//  ChallengeViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/9/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    fileprivate let settingsButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "verticle-dots"), for: .normal)
        bt.addTarget(self, action: #selector(settingBtnClicked), for: .touchUpInside)
        return bt
    }()
    
    @objc func settingBtnClicked(_ sender:UIButton!){
        performSegue(withIdentifier: "settingPopUp", sender: nil)
    }
    @IBAction func infoBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "homeToInfo", sender: nil)
    }
    
    @IBOutlet var TitleTextField: UITextField!
    
    @IBOutlet var CurrChalSubtitle: UILabel!
    @IBOutlet var TypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet var StartDatePicker: UIDatePicker!
    
    @IBOutlet var ChallengeInputView: UIStackView!
    @IBOutlet var startButton: UIButton!
    
    @IBAction func StartButton(_ sender: Any) {
        if startButton.backgroundColor == UIColor(named: "RedColor"){
            //Save to currentChallenge
            Data.currentChallenge.title = TitleTextField.text
            print(Data.currentChallenge.title!)
            Data.currentChallenge.challengeType = TypeSegmentedControl.titleForSegment(at: TypeSegmentedControl.selectedSegmentIndex)
            print(Data.currentChallenge.challengeType!)
            Data.currentChallenge.startDate = StartDatePicker.date
            print(Data.currentChallenge.startDate!)
            
            ChallengeInputView.removeFromSuperview()
            
            CurrChalSubtitle.text = "Current Challenge"
            startButton.backgroundColor = UIColor(named: "BlueColor")
            startButton.setTitle(Data.currentChallenge.title, for: .normal)
            startButton.titleLabel?.font = UIFont(name: "OpenSans-ExtraBold", size: 40)
            let top_constraint = startButton.topAnchor.constraint(equalTo: CurrChalSubtitle.bottomAnchor, constant: 15)
            NSLayoutConstraint.activate([top_constraint])
            
            startButton.addSubview(settingsButton)
            startButton.translatesAutoresizingMaskIntoConstraints = false
            settingsButton.translatesAutoresizingMaskIntoConstraints = false
            settingsButton.trailingAnchor.constraint(equalTo: self.startButton.trailingAnchor, constant: -15).isActive = true
            settingsButton.topAnchor.constraint(equalTo: self.startButton.topAnchor, constant: 15).isActive = true
            settingsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
            settingsButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
            settingsButton.autoresizesSubviews = true
            
            var date = Data.currentChallenge.startDate
            for i in 1...30{
                date = date!.addingTimeInterval(60.0 * 60.0 * 24.0)
                Data.currentDays.append(DayModel(date: date!, dateString: "Day " + String(i), complete: false))
            }
            
        }
        else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let ChallengeViewController = storyBoard.instantiateViewController(withIdentifier: "ChallengeViewController")
            ChallengeViewController.modalPresentationStyle = .fullScreen
            self.present(ChallengeViewController, animated: true, completion: nil)
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 15
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
        if segue.identifier == "settingPopUp"{
            let popup = segue.destination as! SettingsViewController
            popup.doneSaving = { [weak self] in
                self!.startButton.setTitle(Data.currentChallenge.title, for: .normal)
            }
        }
        else if segue.identifier == "homeToInfo"{
            let popup = segue.destination as! InfoViewController
            popup.message = "Type determines what kind of data you want to track. Binary means that the data falls into to catagories. Either it happened or it didn't. Numeric means that the data is a number, like 15 minutes of meditations."
        }
    }
}
