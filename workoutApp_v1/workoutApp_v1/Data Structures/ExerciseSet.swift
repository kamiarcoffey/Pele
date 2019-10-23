//
//  ExerciseSet.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class ExerciseSet: Codable {
    
    var reps: [Rep]
    
    init(with reps: [Rep]) {
        self.reps = reps
    }
    
    func addReps(new reps: [Rep]) {
        self.reps += reps
    }
    
}
