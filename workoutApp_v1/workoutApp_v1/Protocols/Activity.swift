//
//  Activity.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


// weights based activities have a MuscleGroup
public enum MuscleGroup: String, Codable {
    case legs, back, chest, biceps, triceps, shoudlers, booty
    // pull exercises will be back and bi
}


public enum PeleRep: Int, Codable {
    public typealias RawValue = Int
    case oneLift
}



// Activity is a thing you do - squats, jumping jacks etc..
public protocol Activity : Codable {
    var name: String { get set }
    var isWeights: Bool { get set }
    func calculateCalories() -> Double
}

extension Activity {
    var getName: String { return name }
}

public struct PeleExerciseSet: Codable {
    
    var reps: [PeleRep]
    
    init(with reps: [PeleRep]) {
        self.reps = reps
    }
    
    mutating func addReps(new reps: [PeleRep]) {
        self.reps += reps
    }
    
    var repCount: Int {
        return reps.count
    }
    
    var weightTimesSets: Int {
        // TODO: make this a functional reduce
        var totalWeight = 0
        for case let (oneLift) in reps {
            totalWeight += oneLift.rawValue
        }
        return totalWeight
    }
    
}





public protocol WeightsExercise: Activity {
    var targetMuscle: MuscleGroup { get set }
    var sets: [PeleExerciseSet] {get set }
}

extension WeightsExercise {
    
    var isWeights: Bool  { return true }
    }
    
    func calculateCalories() -> Double {
        return 10
        // TOD: implement switch
        
        /*
        return 10
        
        let groupValue = switch MuscleGroup {
        
        case .legs:
            return 10
        }
        case. booty:
        case .back:
        case .chest:
        case .biceps:
        case .triceps:
        case .shoudlers:
        default:
            return 0
        
        return groupValue*weightTimesSets
         */
}




public protocol cardioExercise: Activity {
    var durationMinutes: Double { get set }
}

extension cardioExercise {
    var isWeights: Bool { return false }
}


