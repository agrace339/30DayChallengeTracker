//
//  InfoViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/19/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    var message: String = "Error-No Info"
    @IBOutlet var infoView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var okayBtn: UIButton!
    @IBAction func okayBtnClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.layer.cornerRadius = 10
        okayBtn.layer.cornerRadius = 10
        messageLabel.text = message
        // Do any additional setup after loading the view.
    }

}
