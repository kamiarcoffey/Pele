//
//  PlayRoutineViewModel.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PlayRoutineListViewModel: ObservableObject {
    @Published var routineInProgress: [PlayRoutineViewModel]
    private var routine: PeleRoutine
    
    // this will be pre-generated depending on the exercises in the workout selected to play
    
    init(with routine: PeleRoutine) {
        self.routine = routine
        routineInProgress = []
        for exercise in routine.exerciseList {
            routineInProgress.append(PlayRoutineViewModel(with: exercise))
        }
    }
}

class PlayRoutineViewModel: ObservableObject {
    
    
    // this will belong to a specific exercise
    // it can have an undetermined number of LogSetViewModel (one for each set of that exercise)
    @Published var setsInProgress: [LogSetViewModel]
    private var exercise: PeleExercise
    
    init(with exercise: PeleExercise) {
        self.exercise = exercise
        setsInProgress = []
        generateAdditionalSet()
        generateAdditionalSet()
        generateAdditionalSet()
    }
    
    
    func generateAdditionalSet() {
        setsInProgress.append(LogSetViewModel(with: self.exercise))
    }
    
    func logSet(finishedSet: LogSetViewModel) {
        setsInProgress.append(finishedSet)
    }
}




class LogSetViewModel: Hashable {
    static func == (lhs: LogSetViewModel, rhs: LogSetViewModel) -> Bool {
        return lhs.id == rhs.id
    }

    var exercise: PeleExercise
    var id = UUID()
    var isWeights: Bool
    var exerciseName: String
    var numReps: Int
    var weight: Int
    
    
    // Combine these inits?

    init(with exercise: PeleExercise) {
        self.exercise = exercise
        self.isWeights = exercise.weights
        self.exerciseName = exercise.name
        self.numReps = 0
        self.weight = 0
    }
    
//    init(exerciseName: String, numReps: Int, weight: Int) {
//        self.exerciseName = exerciseName
//        self.numReps = numReps
//        self.weight = weight
//    }
//    
//    init(exerciseName: String, numReps: String, weight: String) {
//        self.exerciseName = exerciseName
//        self.numReps = Int(numReps) ?? 0
//        self.weight = Int(weight) ?? 0
//    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(id)
    }
}
