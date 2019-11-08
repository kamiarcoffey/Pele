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


class WorkoutListViewModel: ObservableObject {
    
    @Published var workouts = [WorkoutViewModel]()
    
    init() {
        fetchAllWorkouts()

    }
    
    func fetchAllWorkouts() {
        self.workouts = WorkoutManager.shared.getAllPeleWorkouts().map(WorkoutViewModel.init)
//        self.workouts = WorkoutManager.shared.getAllWorkouts().map(WorkoutViewModel.init)
    }
    
//    func saveExercise(exercise: Exercise) {
//        CoreDataManager.shared.saveExercise(exercise: <#T##Exercise#>)
//    }
    
}

class WorkoutViewModel: Hashable { // is this the same thing as NSManagedObject? NO. This should turn PeleWorkout into something the view can handle...
    // it will matter more when I start manipulating PeleWorkout things
    static func == (lhs: WorkoutViewModel, rhs: WorkoutViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var name = ""
    var date = ""
    var id = UUID()
    
    let formatter = DateFormatter()
    
    // MARK: if you change workoutReqest.returnsObjectsAsFaults = false, make sure you convert the NSObject before piping it to the View
    init(workout: Session) {
        self.name = workout.name
        self.date = formatter.string(from: workout.date)

    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(id)
    }
    
    var getDate: String {
        return date
    }
}
