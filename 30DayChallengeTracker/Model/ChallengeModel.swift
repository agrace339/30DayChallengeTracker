//
//  ChallengeModel.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/8/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import Foundation
import Charts

class ChallengeModel{
    var id: String!
    var title: String!
    var challengeType: String!
    var startDate: Date!
    var data: [ChartDataEntry]!
    
    init(title: String, challengeType: String, startDate: Date){
        id = UUID().uuidString
        self.title = title
        self.challengeType = challengeType
        self.startDate = startDate
        data = [ChartDataEntry]()
    }

}
