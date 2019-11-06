//
//  CardioExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public protocol CardioExercise: Activity {
    var durationMinutes: Double { get set }
}

extension CardioExercise {
    public var isWeights: Bool { return false }
}
