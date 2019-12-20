//
//  Day.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/11/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import Foundation
class DayModel{
    var date: Date!
    var dateString: String!
    var complete: Bool!
    
    init(date: Date, dateString: String, complete: Bool){
        self.date = date

        self.dateString = dateString
        
        self.complete = complete
    }

}
