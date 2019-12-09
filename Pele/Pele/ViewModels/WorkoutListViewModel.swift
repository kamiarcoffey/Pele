//
//  WorkoutListViewModel.swift
//  Pele
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
    
    public func refresh() {
        self.fetchAllWorkouts()
    }
    
//    public func deleteItem(at indexSet: IndexSet) {
//        let workout = self.workouts at: OffsetShape
//        self.workouts.remove(atOffsets: indexSet)
//        WorkoutHistoryManager.shared.deleteWorkoutdeleteWorkout(with: workout.id)
//
//    }
    
    func fetchAllWorkouts() {
        self.workouts = WorkoutHistoryManager.shared.getAllPeleWorkouts().map(WorkoutViewModel.init)
    }
    
    
}


