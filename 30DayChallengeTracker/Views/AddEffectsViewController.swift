//
//  AddEffectsViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/13/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class AddEffectsViewController: UIViewController {

    @IBOutlet var PopUpView: UIView!
    @IBOutlet var EffectsTitle: UITextField!
    @IBOutlet var TypeButton: UISegmentedControl!
    @IBOutlet var CancelButton: UIButton!
    @IBOutlet var AddButton: UIButton!
    
    var doneSaving: (() -> ())?
    
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
        CancelButton.layer.cornerRadius = 15
        AddButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
}
