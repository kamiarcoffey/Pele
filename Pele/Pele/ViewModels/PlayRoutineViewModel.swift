//
//  PlayRoutineViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/4/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PlayRoutineViewModel: ObservableObject {
//    @Published var exercisesInProgress: [SetViewModel]
    @Published var exercisesInProgress: [LogExerciseViewModel]
    @Published var completedWorkout: PeleWorkout
    
    private var routine: Routine
    
    
    // this will be pre-generated depending on the exercises in the workout selected to play
    
    init(with routine: Routine) {
        self.routine = routine
        self.completedWorkout = PeleWorkout(name: routine.name)
        exercisesInProgress = []
        
        // routine.exerciseList contains a list of PeleExercises
        for exercise in routine.exerciseList {
//            exercisesInProgress.append(LogExerciseViewModel(exercise: exercise))
            exercisesInProgress.append(LogExerciseViewModel(exercise: PeleExercise(exercise)))

        }
    }
    
    public func addExercise(new exercise: Exercise) {
        completedWorkout.add(new: exercise)
    }
    
    func saveWorkout() {
        let saveWorkout = self.completedWorkout // the workout has all the sets saved already
        WorkoutHistoryManager.shared.saveWorkout(workout: saveWorkout)
    }
    

}

//class PlayRoutineViewModel: ObservableObject {
////    @Published var exercisesInProgress: [SetViewModel]
//    @Published var exercisesInProgress: [LogExerciseViewModel]
//    @Published var completedWorkout: PeleWorkout
//
//    private var routine: PeleRoutine
//
//
//    // this will be pre-generated depending on the exercises in the workout selected to play
//
//    init(with routine: PeleRoutine) {
//        self.routine = routine
//        self.completedWorkout = PeleWorkout(name: routine.getName)
//        exercisesInProgress = []
//
//        // routine.exerciseList contains a list of PeleExercises
//        for exercise in routine.exerciseList {
//            exercisesInProgress.append(LogExerciseViewModel(exercise: exercise))
//        }
//    }
//
//    public func addExercise(new exercise: PeleExercise) {
//        completedWorkout.add(new: exercise)
//    }
//
//    func saveWorkout() {
//        let saveWorkout = self.completedWorkout // the workout has all the sets saved already
//        WorkoutHistoryManager.shared.saveWorkout(workout: saveWorkout)
//    }
//
//
//}

