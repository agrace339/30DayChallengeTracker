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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(dayCollectionView)
        dayCollectionView.backgroundColor = UIColor()
        
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
