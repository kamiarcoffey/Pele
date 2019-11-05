//
//  Rep.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public class PeleRep: Codable {
    
    let weightLifted: Int
    let exercise: PeleWorkout
    
    
    
    init(of exerciseType: PeleWorkout, lifted weight: Int) {
        weightLifted = weight
        exercise = exerciseType
    }
    
}
