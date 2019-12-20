//
//  ChallengeViewController.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/10/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import UIKit

protocol CounterDelegate{
    func requestReload(counter:Int)
}

class ChallengeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var lastIndex = 0
    
    func requestReload(counter:Int) {
        Data.completedDays = counter
        CountDaysLabel.text = String(counter)
        CountDaysLabel.setNeedsDisplay()
    }
    
    fileprivate let dayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DayCell.self, forCellWithReuseIdentifier: "day")
        
        return cv
    }()

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBOutlet var ChallengeName: UILabel!
    @IBOutlet var CountDaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChallengeName.text = Data.currentChallenge.title
        view.addSubview(dayCollectionView)
        dayCollectionView.backgroundColor = UIColor(named: "AppBackgroundColor")
        dayCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 116).isActive = true
        dayCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        dayCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        dayCollectionView.bottomAnchor.constraint(equalTo: CountDaysLabel.topAnchor, constant: -15).isActive = true
        
        dayCollectionView.delegate = self
        dayCollectionView.dataSource = self
        
        CountDaysLabel.text = String(Data.completedDays) + "/30 Days Complete!"
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 65)
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Data.currentDays.count)
        return Data.currentDays.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dayModel = Data.currentDays[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! DayCell
        cell.date.text = dayModel.dateString!
        
        if dayModel.complete == true{
            cell.backgroundColor = UIColor(named: "BlueColor")
            cell.date.textColor = UIColor(named: "BackgroundColor")
        }
        else{
            cell.backgroundColor = UIColor(named: "BackgroundColor")
            cell.date.textColor = UIColor(named: "TextColor")
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = Data.updateCurrentDay()
        if indexPath.row > x{
            //TODO - Notify user that they can't check in in the future
            print("Future Day")
        }
        else{
            if Data.currentChallenge.challengeType == "Numeric"{
                lastIndex = indexPath.row
                performSegue(withIdentifier: "checkin", sender: nil)
            }
                
            else{
                let cell = collectionView.cellForItem(at: indexPath) as! DayCell
                if cell.backgroundColor == UIColor(named: "BackgroundColor"){
                    cell.backgroundColor = UIColor(named: "BlueColor")
                    cell.date.textColor = UIColor(named: "BackgroundColor")
                    Data.currentDays[indexPath.row].complete = true
                    Data.completedDays += 1
                    CountDaysLabel.text = String(Data.completedDays) + "/30 Days Complete!"
                }
                
                else{
                    cell.backgroundColor = UIColor(named: "BackgroundColor")
                    cell.date.textColor = UIColor(named: "TextColor")
                    Data.currentDays[indexPath.row].complete = false
                    Data.completedDays -= 1
                    CountDaysLabel.text = String(Data.completedDays) + "/30 Days Complete!"
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "checkin"{
            let popup = segue.destination as! CheckInViewController
            popup.dayIndex = lastIndex
            popup.doneSaving = { [weak self] in
                self?.dayCollectionView.reloadData()
            }
        }
    }
}

class DayCell: UICollectionViewCell{
    let date: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.textAlignment = .center
        label.text = "hello"
        return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        date.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(date)
        date.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        date.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        date.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        date.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = CGColor(srgbRed: 0.929, green: 0.145, blue: 0.306, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

