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
    private var routine: PeleRoutine
    
    // this will be pre-generated depending on the exercises in the workout selected to play
    
    init(with routine: PeleRoutine) {
        self.routine = routine
        workoutsInProgress = []
        for exercise in routine.exerciseList {
            workoutsInProgress.append(SetViewModel())
        }
    }
}

class SetViewModel: ObservableObject, Hashable {
    
    // this will belong to a specific exercise
    // it can have an undetermined number of LogExerciseViewModel (one for each set of that exercise)
    @Published var setsInProgress: [PeleExerciseSet]
    @Published var completedSets: [PeleExerciseSet]
    
    var id = UUID()
    
    init() {
        setsInProgress = []
        completedSets = []
        self.generateAdditionalSet()
        self.generateAdditionalSet()
        self.generateAdditionalSet()
    }
    
    
    func generateAdditionalSet() {
        setsInProgress.append(PeleExerciseSet())
    }
    
    func logSet(finishedSet: PeleExerciseSet) {
        completedSets.append(finishedSet)
    }
}

extension SetViewModel {
    
    public static func == (lhs: SetViewModel, rhs: SetViewModel) -> Bool {
       return (lhs.id == rhs.id)
    }
     
    // id is enough to uniquley identify an Exercise
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
   }
}
