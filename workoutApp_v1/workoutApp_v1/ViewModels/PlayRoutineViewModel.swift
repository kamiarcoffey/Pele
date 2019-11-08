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

class PlayRoutineViewModel: ObservableObject {
    @Published var workoutsInProgress: [SetViewModel]
    @Published var completedWorkout: PeleWorkout
    
    private var routine: PeleRoutine
    
    
    // this will be pre-generated depending on the exercises in the workout selected to play
    
    init(with routine: PeleRoutine) {
        self.routine = routine
        self.completedWorkout = PeleWorkout(name: routine.getName)
        workoutsInProgress = []
        for _ in routine.exerciseList { // for exercise in 
            workoutsInProgress.append(SetViewModel())
        }
    }
    
    public func addExercise(new exercise: PeleExercise) {
        completedWorkout.add(new: exercise)
    }
    
//    public func updateWorkoutInProgress(with newSets: [Activity]) { // newSets are PeleExerciseSet
//        let indexOfExercise = workoutsInProgress.firstIndex(of: exercise) ?? 0
//        let updatedExercise = PeleExercise(previous: routine.exerciseList[indexOfExercise], newSets: newSets as! [PeleExerciseSet])
//        completedWorkout.add(new: [updatedExercise])
//        print("here")
//    }

}

