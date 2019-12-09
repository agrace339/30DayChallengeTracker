//
//  ChallengeFunctions.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/8/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import Foundation

class ChallengeFunctions{
    static func createChallenge(challengeModel: ChallengeModel){
        
    }
    
    static func readArchivedChallenges(){
        
    }
    
    static func readCurrentChallenge(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.currentChallenge.count == 0{
                var date = DateComponents()
                date.year = 2019
                date.month = 12
                date.day = 9
                Data.currentChallenge.append(ChallengeModel(title: "Drink Water", challengeType: "Binary", startDate: date))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    static func updateChallenges(challengeModel: ChallengeModel){
        
    }
    
    static func deleteChallenge(challengeModel: ChallengeModel){
        
    }
}
