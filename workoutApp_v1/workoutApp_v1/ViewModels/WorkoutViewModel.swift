//
//  WorkoutViewModel.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 11/9/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class WorkoutViewModel: Hashable { // is this the same thing as NSManagedObject? NO. This should turn PeleWorkout into something the view can handle...
    // it will matter more when I start manipulating PeleWorkout things
    static func == (lhs: WorkoutViewModel, rhs: WorkoutViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var name = ""
    var date = ""
    var id = UUID()
    var exercises: [Activity]
    
    let formatter = DateFormatter()
    
    // MARK: if you change workoutReqest.returnsObjectsAsFaults = false, make sure you convert the NSObject before piping it to the View
    init(workout: Session) {
        self.name = workout.name
        self.date = formatter.string(from: workout.date)
        self.exercises = workout.exercises
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(id)
    }
    
    var getDate: String {
        return date
    }
    
}
