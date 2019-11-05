//
//  ExerciseSet.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public class PeleExerciseSet: Codable {
    
    var reps: [PeleRep]
    
    init(with reps: [PeleRep]) {
        self.reps = reps
    }
    
    func addReps(new reps: [PeleRep]) {
        self.reps += reps
    }
    
}



class PeleWorkout: Session {
    var name = "test"
    var date = Date()
    var weights = true

    
    func getName() -> String {
        return name
    }
}
