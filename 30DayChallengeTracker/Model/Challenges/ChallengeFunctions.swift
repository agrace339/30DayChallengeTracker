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

            Data.currentChallenge = ChallengeModel(title: "Drink Water", challengeType: "Binary", startDate: Date())
            
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
