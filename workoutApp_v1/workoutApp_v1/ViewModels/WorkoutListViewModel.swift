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
    }
    
    
}


