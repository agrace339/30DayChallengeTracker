//
//  AddEffectsViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/13/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class AddEffectsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var PopUpView: UIView!
    @IBOutlet var EffectsTitle: UITextField!
    @IBOutlet var TypeButton: UISegmentedControl!
    @IBOutlet var CancelButton: UIButton!
    @IBOutlet var AddButton: UIButton!
    
    var doneSaving: (() -> ())?
    
    @IBAction func infoBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "addEffectToInfo", sender: nil)
    }
    @IBAction func CancelButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func AddButtonClicked(_ sender: Any) {
        let model = EffectsModel(title: EffectsTitle.text ?? "No Name", type: (TypeButton?.titleForSegment(at: TypeButton!.selectedSegmentIndex))!)
        Data.currentEffects.append(model)
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
        EffectsTitle.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.EffectsTitle.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.EffectsTitle.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addEffectToInfo"{
            let popup = segue.destination as! InfoViewController
            popup.message = "Type determines what kind of data you want to track. Binary means that the data falls into to catagories. Either it happened or it didn't. Numeric means that the data is a number, like 15 minutes of meditations."
        }
    }
}
