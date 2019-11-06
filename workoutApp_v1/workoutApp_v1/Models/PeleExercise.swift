//
//  PeleExercise.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

public struct Rep: RepProtocol, Codable {
    var weightLifted: Int
    public var weight: Int { return weightLifted }
}

public struct PeleExerciseSet: SetProtocol {
    public typealias typeOfRep = Rep
    public var reps: [Rep]
}


public class PeleExercise : WeightsExercise, Identifiable, Codable, Hashable {
    
    public var id: UUID
    public var name: String
    public var targetMuscle: MuscleGroup
    public var sets: [PeleExerciseSet]

    init(_ name: String, target muscle: MuscleGroup, sets: [PeleExerciseSet]) {
        self.name = name
        self.id = UUID()
        self.targetMuscle = muscle
        self.sets = sets
    }
    
    convenience init(_ name: String) {
        self.init(name, target: MuscleGroup.booty, sets: [PeleExerciseSet]())
    }
    
    public func getName() -> String {
        return self.name
    }
}


// MARK: conform to Hashable
extension PeleExercise {
    
    public static func == (lhs: PeleExercise, rhs: PeleExercise) -> Bool {
       return (lhs.getName() == rhs.getName())
    }
     
    // name is enough to uniquley identify an Exercise
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
   }
}
