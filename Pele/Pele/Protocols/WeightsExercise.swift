//
//  WeightsExercise.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI


public protocol WeightsExercise: Activity, TimeSeriesDisplayable {
    var targetMuscle: MuscleGroup { get set }
    var sets: [PeleExerciseSet] { get set }
    var date: Date { get set }
}

extension WeightsExercise {
    public var isWeights: Bool { return true }
    public func calculateCalories() -> Double {
        return 10
    }
}


enum displayTypeError: Error {
    case notFound
}


extension WeightsExercise {
    
    public func displayableTimeSeries(displaying: displayType) -> [(CGFloat, String)] {
        switch displaying {
        case .reps:
            return self.sets.map{ (CGFloat($0.reps.count), self.date.description(with: .current)) }
        case .weight:
            return self.sets.map{ (CGFloat($0.repWeight), self.date.description(with: .current)) }
            
        default:
            return [(CGFloat, String)]()
        }
    }
}
