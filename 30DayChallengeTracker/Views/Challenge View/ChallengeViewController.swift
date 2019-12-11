//
//  ChallengeViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/10/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    fileprivate let dayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    @IBOutlet var ChallengeName: UILabel!
    @IBOutlet var HeaderView: UIView!
    @IBOutlet var CountDaysLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChallengeName.text = Data.currentChallenge.title
        view.addSubview(dayCollectionView)
        dayCollectionView.backgroundColor = UIColor.white
        dayCollectionView.topAnchor.constraint(equalToSystemSpacingBelow: HeaderView.bottomAnchor, multiplier: 15).isActive = true
        //dayCollectionView.bottomAnchor.constraint(equalToSystemSpacingBelow: CountDaysLabel.topAnchor, multiplier: -30).isActive = true
        dayCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        dayCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        
        // Do any additional setup after loading the view.
    }
}

extension UIViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
