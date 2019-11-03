//
//  Activity.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public protocol Activity {
    
    var name: String { get set }
    var weights: Bool { get set }
    
    // var date: Date { get set }
    // perhaps the date should be auto set when the workouts saves? yes.
    
    func getName() -> String
}


class PeleWorkout: Activity {
    var name = "test"
    var date = Date()
    var weights = true

    
    func getName() -> String {
        return name
    }
}

