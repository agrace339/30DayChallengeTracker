//
//  ChallengeViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/9/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var TitleTextField: UITextField!
    
    @IBOutlet var CurrChalSubtitle: UILabel!
    @IBOutlet var TypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet var StartDatePicker: UIDatePicker!
    
    @IBOutlet var ChallengeInputView: UIStackView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var ArchivedChallenges: UILabel!
    
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
            var date = Data.currentChallenge.startDate
            for _ in 0...29{
                date = date!.addingTimeInterval(60.0 * 60.0 * 24.0)
                Data.currentDays.append(DayModel(date: date!, complete: false))
            }
            
        }
        else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let ChallengeViewController = storyBoard.instantiateViewController(withIdentifier: "ChallengeViewController")
            self.present(ChallengeViewController, animated: true, completion: nil)
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
        ArchivedChallenges.layer.cornerRadius = 20
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
