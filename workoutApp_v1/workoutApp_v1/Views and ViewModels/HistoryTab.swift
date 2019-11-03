//
//  HistoryView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI
import Foundation

struct HistoryTab: View {
    
    @ObservedObject var workoutListViewModel: WorkoutListViewModel
    
    init() {
        self.workoutListViewModel = WorkoutListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.workoutListViewModel.workouts, id: \.self) { workout in
                    HStack {
                        Text(workout.name)
                        Text(workout.getDate)
                    }
                }
            }
        }
    }
}