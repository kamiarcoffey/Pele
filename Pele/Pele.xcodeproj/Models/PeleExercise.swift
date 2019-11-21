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

public struct PeleExerciseSet: SetProtocol, Hashable {
    public typealias typeOfRep = Rep
    public var reps: [Rep]
    public var id = UUID()
    
    init() {
        self.reps = []
    }
    
    init(reps: [Rep]) {
        self.reps = reps
    }
    
    var repWeight: Int {
        return self.reps.compactMap{ $0.weight }.max() ?? 0
    }
}

extension PeleExerciseSet {
    
    public static func == (lhs: PeleExerciseSet, rhs: PeleExerciseSet) -> Bool {
       return (lhs.id == rhs.id)
    }
     
    // id is enough to uniquley identify an Exercise
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
   }
}

/// PeleExercises are an actual exercise - a name, and a muscle group. They are more than a collection of ExerciseSets
/// PeleWorkout is a collection of PeleExercises with additional meta data corresponding to which routine they are generated from, their date etc.
public struct PeleExercise : WeightsExercise, Identifiable, Codable, Hashable {
    
    public var id: UUID
    public var name: String
    public var targetMuscle: MuscleGroup
    public var sets: [PeleExerciseSet]
    
    init(_ name: String, id: UUID, target muscle: MuscleGroup, sets: [PeleExerciseSet]) {
        self.name = name
        self.id = id
        self.targetMuscle = muscle
        self.sets = sets
    }

    
    // TODO: combine these convinience inits
    init(_ name: String, target muscle: MuscleGroup, sets: [PeleExerciseSet]) {
        self.name = name
        self.id = UUID()
        self.targetMuscle = muscle
        self.sets = sets
    }
    
    init(_ name: String) {
        self.init(name, target: MuscleGroup.booty, sets: [PeleExerciseSet]())
    }
    
    init(_ name: String, sets: [PeleExerciseSet]) {
        self.init(name, target: MuscleGroup.booty, sets: sets)
    }
    
    init(exerciseSet: ExerciseSet) {
        self.id = UUID()
        self.name = exerciseSet.exerciseName ?? "Un-named exercise"
        self.targetMuscle = .booty // TODO: update
        self.sets = [PeleExerciseSet.init(reps: (0..<Int(exerciseSet.numReps)).compactMap{_ in Rep.init(weightLifted: Int(exerciseSet.weight))})]
    }
    
    public func getName() -> String {
        return self.name
    }
    
//    init(previous exercise: PeleExercise, newSets:[PeleExerciseSet]) {
//        self.name = exercise.name
//        self.id = exercise.id
//        self.targetMuscle = exercise.targetMuscle
//        self.sets = exercise.sets + newSets
//    }
    
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
