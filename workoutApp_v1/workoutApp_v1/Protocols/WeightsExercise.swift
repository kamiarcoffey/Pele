//
//  WeightsExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public protocol WeightsExercise: Activity {
    var targetMuscle: MuscleGroup { get set }
    var sets: [PeleExerciseSet] {get set }
}

extension WeightsExercise {
    public var isWeights: Bool { return true }
    public func calculateCalories() -> Double {
        return 10
    }
}
