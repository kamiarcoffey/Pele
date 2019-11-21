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
    
    @Published var barChartFormattedValues: [[CGFloat]]
    private let activity: Activity
    
    init(activity: Activity) {
        self.activity = activity
        self.barChartFormattedValues = [[CGFloat]]()
        self.fetchDisplayBarValues()
    }
    
    func fetchDisplayBarValues() {
        let exercises = ExerciseHistoryManager.shared.getAllPeleExercises(activity: self.activity)
        let repNums = exercises.flatMap{ $0.sets.compactMap{ CGFloat($0.reps.count)}}
        let weightNums = exercises.flatMap{ $0.sets.compactMap{ CGFloat($0.repWeight)}}
        self.barChartFormattedValues = [repNums, weightNums]
    }

}


