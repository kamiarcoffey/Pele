//
//  HistoryView.swift
//  workoutApp_v1
//
//  Created by Kamiar Coffey on 10/30/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var workoutListViewModel: WorkoutListViewModel
    
    init() {
        self.workoutListViewModel = WorkoutListViewModel()
    }

    
    var body: some View {
                    
        List {
            ForEach(self.workoutListViewModel.workouts, id: \.name) { order in
                Text(order.name)
            }
        }
    }
}