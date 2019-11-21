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

class WorkoutViewModel: Hashable, ObservableObject {

    
    @Published var name = ""
    @Published var date = ""
    @Published var id = UUID()
    @Published var exercises: [PeleExercise]
    
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
    
    // TODO: delete objects
    // will have to run a fetch predicate match then delete those since we are using Pele objects, not NSManaged ones
}

// MARK: Conform to hashable to display a list

extension WorkoutViewModel {
    static func == (lhs: WorkoutViewModel, rhs: WorkoutViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
