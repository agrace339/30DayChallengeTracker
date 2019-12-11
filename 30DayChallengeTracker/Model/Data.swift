//
//  Data.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/9/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import Foundation
class Data {
    static var currentChallenge = ChallengeModel(title: "Challenge", challengeType: "type", startDate: Date())
    static var archivedChallenges = [ChallengeModel]()
    
}
