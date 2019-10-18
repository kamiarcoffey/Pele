//
//  ExerciseSet.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class ExerciseSet {
    
    var reps: [Rep]
    
    init() {
        reps = [Rep]()
    }
    
    func addReps(new reps: [Rep]) {
        self.reps += reps
    }
    
}
