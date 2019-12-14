//
//  GraphingPageViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/14/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit
import Charts

class GraphingPageViewController: UIViewController, UITextFieldDelegate {

    var effectIndex: Int = 0
    
    @IBOutlet var EffectName: UILabel!
    @IBOutlet var AddButton: UIButton!
    @IBOutlet var InputView: UIView!
    @IBOutlet var Graph: LineChartView!
    
    fileprivate let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Incomplete","Complete"])
        sc.selectedSegmentIndex = 0
        sc.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "OpenSans-Regular", size: 14)!], for: .normal)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    fileprivate var numInput: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(named: "BackgroundColor")
        tf.textColor = UIColor(named: "TextColor")
        tf.font = UIFont(name: "OpenSans-Regular", size: 15)
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor(srgbRed: 0.898, green: 0.898, blue: 0.918, alpha: 1)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    @IBAction func AddButtonClicked(_ sender: Any) {
        if Data.currentEffects[effectIndex].type == "Binary"{
            Data.currentEffects[effectIndex].data.append(Float(segmentedControl.selectedSegmentIndex))
        }
        else{
            Data.currentEffects[effectIndex].data.append(NumberFormatter().number(from: numInput.text!)!.floatValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EffectName.text = Data.currentEffects[effectIndex].title
        InputView.translatesAutoresizingMaskIntoConstraints = false
        if Data.currentEffects[effectIndex].type == "Binary"{
            InputView.addSubview(segmentedControl)
            segmentedControl.topAnchor.constraint(equalTo: InputView.topAnchor, constant: 15).isActive = true
            segmentedControl.leadingAnchor.constraint(equalTo: InputView.leadingAnchor, constant: 15).isActive = true
            segmentedControl.bottomAnchor.constraint(equalTo: InputView.bottomAnchor, constant: -15).isActive = true
            segmentedControl.trailingAnchor.constraint(equalTo: AddButton.leadingAnchor, constant: -15).isActive = true
        }
        else{
           InputView.addSubview(numInput)
            numInput.topAnchor.constraint(equalTo: InputView.topAnchor, constant: 15).isActive = true
            numInput.leadingAnchor.constraint(equalTo: InputView.leadingAnchor, constant: 15).isActive = true
            numInput.bottomAnchor.constraint(equalTo: InputView.bottomAnchor, constant: -15).isActive = true
            numInput.trailingAnchor.constraint(equalTo: AddButton.leadingAnchor, constant: -15).isActive = true
            numInput.delegate = self
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
      let allowedCharacters = CharacterSet.decimalDigits
      let characterSet = CharacterSet(charactersIn: string)
      return allowedCharacters.isSuperset(of: characterSet)
    }
}
