//
//  PeleExercise.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/5/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation


/// PeleExercises are an actual exercise - a name, and a muscle group. They are more than a collection of ExerciseSets
/// PeleWorkout is a collection of PeleExercises with additional meta data corresponding to which routine they are generated from, their date etc.
public struct PeleExercise : WeightsExercise, Identifiable, Codable, Hashable {
    
    public var id: UUID
    public var name: String
    public var targetMuscle: MuscleGroup
    public var sets: [PeleExerciseSet]
    public var date: Date
    
    init(_ name: String, id: UUID, target muscle: MuscleGroup, sets: [PeleExerciseSet]) {
        self.name = name
        self.id = id
        self.targetMuscle = muscle
        self.sets = sets
        self.date = Date()
    }
    
    
    // TODO: combine these convinience inits
    init(_ name: String, target muscle: MuscleGroup, sets: [PeleExerciseSet]) {
        self.init(name, id: UUID(), target: muscle, sets: sets)
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
        self.sets = [PeleExerciseSet()]
        self.sets = [PeleExerciseSet.init(reps: (0..<Int(exerciseSet.numReps)).compactMap{_ in Rep.init(weightLifted: Int(exerciseSet.weight))})]
        self.date = exerciseSet.workout!.date!
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
