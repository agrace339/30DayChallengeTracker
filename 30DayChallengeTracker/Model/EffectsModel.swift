//
//  File.swift
//  30DayChallengeTracker
//
//  Created by Anna Grace on 12/12/19.
//  Copyright © 2019 Anna Grace. All rights reserved.
//

import Foundation
import Charts

class EffectsModel{
    var title:String!
    var type:String!
    var data:[ChartDataEntry]!
    
    init(title: String, type: String){
        self.title = title
        self.type = type
        data = [ChartDataEntry]()
    }
}
