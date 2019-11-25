//
//  ExerciseHistoryViewModel.swift
//  Pele
//
//  Created by Kamiar Coffey on 11/20/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import Foundation
import SwiftUI


class ExerciseHistoryViewModel: ObservableObject {
    
    @Published var barChartFormattedValues = [[(CGFloat, String)]]()

    private let activity: Activity
    
    init(activity: Activity) {
        self.activity = activity
        self.fetchDisplayBarValues()
    }
    
    func fetchDisplayBarValues() {
        let exercises = ExerciseHistoryManager.shared.getAllPeleExercises(activity: self.activity)

        let repsData = exercises.flatMap{ $0.displayableTimeSeries(displaying: .reps)}
        let weightsData = exercises.flatMap{ $0.displayableTimeSeries(displaying: .weight)}
        self.barChartFormattedValues = [repsData, weightsData]

    }
}


