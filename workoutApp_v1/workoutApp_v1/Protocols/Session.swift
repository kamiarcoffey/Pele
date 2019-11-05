//
//  Activity.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

// weightsWorkouts and CardioWorkouts both implement Session
public protocol Session : Codable {
    
    var name: String { get set }
    var date: Date { get set }
    var exercises: [PeleExercise] { get set } // [Activity]
    
    func getName() -> String
}

