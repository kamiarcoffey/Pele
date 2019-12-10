//
//  ExerciseViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/7/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class LogExerciseViewModel: ObservableObject {
    
    // this will belong to a specific exercise
    // it can have an undetermined number of SetViewModel (one for each set of that exercise)
    @Published var setsInProgress: [SetViewModel]
    @Published var completedSets: [PeleExerciseSet]
    private var exercise: Exercise
    
    var id = UUID()
    
    init(exercise: Exercise) {
        self.exercise = exercise
        setsInProgress = []
        completedSets = []
        self.generateAdditionalSet()
        self.generateAdditionalSet()
        self.generateAdditionalSet()
    }
    
    func generateAdditionalSet() {
        setsInProgress.append(SetViewModel(exercise: self.exercise))
    }
    
    func logSet(finishedSet: PeleExerciseSet) {
        completedSets.append(finishedSet)
        
    }
    
    public func displayName() -> String {
        return self.exercise.getName()
    }
    
    public func getExerciseDetails() -> (String, UUID, MuscleGroup) {
        return (exercise.name, exercise.id, exercise.targetMuscle)
    }
}

