//
//  Rep.swift
//  workoutApp
//
//  Created by Kamiar Coffey on 10/17/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public class Rep: Codable {
    
    let weightLifted: Int
    let exercise: Exercise
    
    
    
    init(of exerciseType: Exercise, lifted weight: Int) {
        weightLifted = weight
        exercise = exerciseType
    }
    
}
