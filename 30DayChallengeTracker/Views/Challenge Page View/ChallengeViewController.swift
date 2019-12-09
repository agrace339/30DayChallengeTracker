//
//  ChallengeViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/9/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    @IBOutlet var TitleTextField: UITextField!
    
    @IBOutlet var InputView: UIView!
    
    @IBOutlet var TypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet var StartDatePicker: UIDatePicker!
    
    @IBAction func StartButton(_ sender: Any) {
        //Save to currentChallenge
        Data.currentChallenge.title = TitleTextField.text
        print(Data.currentChallenge.title!)
        Data.currentChallenge.challengeType = TypeSegmentedControl.titleForSegment(at: TypeSegmentedControl.selectedSegmentIndex)
        print(Data.currentChallenge.challengeType!)
        Data.currentChallenge.startDate = StartDatePicker.date
        print(Data.currentChallenge.startDate!)
        
        InputView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
