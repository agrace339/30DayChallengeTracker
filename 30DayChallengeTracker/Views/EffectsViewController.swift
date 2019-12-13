//
//  EffectsViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/11/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class EffectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    fileprivate let effectsTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    @IBOutlet var ChallengeName: UILabel!
    
    @IBAction func addEffectsClicked(_ sender: Any) {
        
    }
    
    @IBOutlet var EffectsHeader: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChallengeName.text = Data.currentChallenge.title

        
        self.view.addSubview(effectsTableView)
        effectsTableView.backgroundColor = UIColor(named: "RedColor")
        effectsTableView.topAnchor.constraint(equalTo: EffectsHeader.bottomAnchor, constant: 15).isActive = true
        effectsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        effectsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 30).isActive = true
        effectsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        
        effectsTableView.delegate = self
        effectsTableView.dataSource = self
        
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.currentEffects.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as! EffectsCell
        cell.textLabel?.text = Data.currentEffects[indexPath.row].title
        return cell
        
    }
    
   
}

class EffectsCell: UITableViewCell{
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


