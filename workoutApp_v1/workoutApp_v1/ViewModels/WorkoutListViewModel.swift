//
//  WorkoutListViewModel.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


//class WorkoutListViewModel: ObservableObject {
//    
//    @Published
//    var workouts = [WorkoutViewModel]()
//    
//    init() {
//        fetchAllWorkouts()
//    }
//    
//    func fetchAllWorkouts() {
//        self.workouts = CoreDataManager.shared.getAllWorkouts().map(WorkoutViewModel.init)
//    }
//    
////    func saveExercise(exercise: Exercise) {
////        CoreDataManager.shared.saveExercise(exercise: <#T##Exercise#>)
////    }
//    
//}
//
//class WorkoutViewModel {
//    
//    var name = ""
//    var date = ""
//    
//    let formatter = DateFormatter()
//    
//    init(workout: Workout) {
//        self.name = workout.name!
//        self.date = formatter.string(from: workout.date!)
//
//    }
//}
