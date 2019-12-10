//
//  RoutineViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 12/10/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


//===----------------------------------------------------------------------===//
//
//  This class is a ViewModel
//  It lists all the exercises in a routine
//
//===----------------------------------------------------------------------===//

class RoutineViewModel: ObservableObject {
    
    @Published var exercises = [Exercise]() //[ExerciseViewModel]()
    var routine: Routine
    
    init(for routine: Routine) {
        self.routine = routine
        fetchAllExercises()
    }
    
    func fetchAllExercises() {
        self.exercises = RoutineManager.shared.getAllExercises() // .map(ExerciseViewModel.init)
    }

}



class ExerciseViewModel {
    var name = ""
    
    init(exercise: Exercise ) {
        self.name = exercise.name
    }
}

