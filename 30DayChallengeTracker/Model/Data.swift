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
    static var completedDays: Int = 0
    static var currentDays = [DayModel]()
    static var archivedChallenges = [ChallengeModel]()
    static var currentEffects = [EffectsModel]()
    
    static var currentDay:Int = 0
    
    static func updateCurrentDay() -> Int{
        let calendar = NSCalendar.current
        
        let date1 = calendar.startOfDay(for: Data.currentChallenge.startDate)
        let date2 = calendar.startOfDay(for: Date())

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        Data.currentDay = components.day!
        return components.day!
    }
}
