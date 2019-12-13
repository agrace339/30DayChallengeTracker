//
//  ChallengeModel.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/8/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import Foundation

class ChallengeModel{
    var id: String!
    var title: String!
    var challengeType: String!
    var startDate: Date!
    
    init(title: String, challengeType: String, startDate: Date){
        id = UUID().uuidString
        self.title = title
        self.challengeType = challengeType
        self.startDate = startDate
    }

}
