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
        cv.register(DayCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    @IBOutlet var ChallengeName: UILabel!
    @IBOutlet var CountDaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChallengeName.text = Data.currentChallenge.title
        view.addSubview(dayCollectionView)
        dayCollectionView.backgroundColor = UIColor.white
        dayCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 116).isActive = true
        dayCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        dayCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        dayCollectionView.bottomAnchor.constraint(equalTo: CountDaysLabel.topAnchor, constant: -15).isActive = true
        
        dayCollectionView.delegate = self
        dayCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension UIViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Data.currentDays.count)
        return Data.currentDays.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dayModel = Data.currentDays[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DayCell
        //cell.date.text = dayModel.dateString!
        print(cell.date.text!)
        if dayModel.complete == true{
            cell.backgroundColor = UIColor(named: "BlueColor")
            cell.date.textColor = UIColor(named: "BackgroundColor")
        }
        else{
            cell.backgroundColor = UIColor(named: "BackgroundColor")
            cell.date.textColor = UIColor(named: "TextColor")
        }
        
        return cell
    }
    
    
}

class DayCell: UICollectionViewCell{
    let date: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Regular", size: 9)
        label.textAlignment = .center
        label.text = "hello"
        return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(date)
        
        date.topAnchor.constraint(equalTo : contentView.topAnchor, constant: 0).isActive = true
        date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = CGColor(srgbRed: 0.929, green: 0.145, blue: 0.306, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

