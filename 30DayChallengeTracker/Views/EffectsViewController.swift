//
//  EffectsViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/11/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class EffectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var lastIndex = 0
    
    fileprivate let effectsTableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "day")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 66
        
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
        effectsTableView.backgroundColor = UIColor(named: "AppBackgroundColor")
        effectsTableView.topAnchor.constraint(equalTo: EffectsHeader.bottomAnchor, constant: 15).isActive = true
        effectsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        effectsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 30).isActive = true
        effectsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        //When figure out footer spacing
        //effectsTableView.separatorColor = UIColor(named: "AppBackgroundColor")
        effectsTableView.delegate = self
        effectsTableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "effectsPopUp"{
            let popup = segue.destination as! AddEffectsViewController
            popup.doneSaving = { [weak self] in
                self?.effectsTableView.reloadData()
            }
        }
        else if segue.identifier == "graphview"{
            let graphview = segue.destination as! GraphingPageViewController
            graphview.effectIndex = lastIndex
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.currentEffects.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "day", for: indexPath)
        cell.textLabel?.textColor = UIColor(named: "TextColor")
        cell.textLabel?.font = UIFont(name: "OpenSans-Regular", size: 18)
        //cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        cell.textLabel?.text = Data.currentEffects[indexPath.row].title
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastIndex = indexPath.row
        performSegue(withIdentifier: "graphview", sender: nil)
    }
    
   
}

