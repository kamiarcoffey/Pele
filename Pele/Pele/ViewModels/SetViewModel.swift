//
//  SetViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/21/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation

class SetViewModel: ObservableObject {
    @Published var previousWeight = 0
    @Published var previousReps = 0
    var id = UUID()
    private var exercise: PeleExercise
    
    init(exercise: PeleExercise) {
        self.exercise = exercise
        self.populatePreviousValues()
    }
    
    func populatePreviousValues() {
        let historicalExercises = ExerciseHistoryManager.shared.getAllPeleExercises(activity: self.exercise)
        self.previousWeight = historicalExercises.flatMap{ $0.sets }.compactMap{ $0.repWeight }.max() ?? 0
        self.previousReps = 8
    }

}
